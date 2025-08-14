/* $Id$ */
/*****************************************************************************
 * Copyright (c) 2025, Nishi                                                 *
 * All rights reserved.                                                      *
 *                                                                           *
 * Redistribution and use in source and binary forms, with or without        *
 * modification, are permitted provided that the following conditions are    *
 * met:                                                                      *
 * 1. Redistributions of source code must retain the above copyright notice, *
 *    this list of conditions and the following disclaimer.                  *
 * 2. Redistributions in binary form must reproduce the above copyright      *
 *    notice, this list of conditions and the following disclaimer in the    *
 *    documentation and/or other materials provided with the distribution.   *
 * 3. Neither the name of the <organization> nor the names of its            *
 *    contributors may be used to endorse or promote products derived from   *
 *    this software without specific prior written permission.               *
 *                                                                           *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS   *
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED     *
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A           *
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER>   *
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR    *
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF      *
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS  *
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN   *
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)   *
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF    *
 * THE POSSIBILITY OF SUCH DAMAGE.                                           *
 *****************************************************************************
 * pvi, the POSIX vi                                                         *
 *                                                                           *
 * Nishi                                                                     *
 * August 2025                                                               *
 *                                                                           *
 * Please forward bug reports to                                             *
 *                                                                           *
 *   nishi (at) nishi.boats on the email                                     *
 *   nishi (at) irc.nishi.boats on the IRC                                   *
 *****************************************************************************/

#include "common.h"

void* array_grow(void* data, size_t size){
	if(data == NULL){
		size_t* r = malloc(sizeof(size_t) + size);
		r[0] = 1;
		return &r[1];
	}else{
		size_t old = array_length(data);
		size_t* r = (size_t*)malloc(sizeof(size_t) + (size * (old + 1)));
		r[0] = old + 1;
		memcpy(&r[1], data, size * old);
		free(data);
		return &r[1];
	}
}

void* array_delete_body(void* data, size_t size, int index){
	size_t incr = 0;
	int i;
	int max;
	void* r;
	unsigned char* start;
	if(data == NULL) return NULL;
	if((max = array_length(data)) <= index) return data;

	r = malloc(sizeof(size_t) + (size * (max - 1)));

	start = (unsigned char*)(&((size_t*)r)[1]);

	for(i = 0; i < max; i++){
		if(i != index){
			memcpy(start + incr, ((unsigned char*)data) + i * size, size);
			incr += size;
		}
	}

	((size_t*)r)[0] = max - 1;

	free(&((size_t*)data)[-1]);

	return &((size_t*)r)[1];
}

void array_free_body(void* data){
	if(data == NULL) return;
	free(&((size_t*)data)[-1]);
}

size_t array_length(void* data){
	if(data == NULL) return 0;
	return ((size_t*)data)[-1];
}
