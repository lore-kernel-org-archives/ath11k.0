Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQZbg-00010r-DE
 for ath11k@lists.infradead.org; Thu, 08 Oct 2020 17:21:33 +0000
MIME-Version: 1.0
Date: Thu, 08 Oct 2020 10:21:30 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH V3 2/9] mac80211: add multiple bssid support to interface
 handling
In-Reply-To: <cc1fd0b5-d12f-0cdc-f918-b8f761b18c88@phrozen.org>
References: <20200812150050.2683396-1-john@phrozen.org>
 <20200812150050.2683396-3-john@phrozen.org>
 <6e914f17bc1fcd57bfb1a0d9f68fe4ad@codeaurora.org>
 <cc1fd0b5-d12f-0cdc-f918-b8f761b18c88@phrozen.org>
Message-ID: <54033ab6e1bcf7ecda314c3ec81f1736@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

T24gMjAyMC0xMC0wOCAwMTowNiwgSm9obiBDcmlzcGluIHdyb3RlOgo+IE9uIDA4LjEwLjIwIDAy
OjMzLCBQcmFkZWVwIEt1bWFyIENoaXRyYXB1IHdyb3RlOgo+Pj4gCj4+PiDCoHN0YXRpYyBpbnQg
aWVlZTgwMjExX2RlbF9pZmFjZShzdHJ1Y3Qgd2lwaHkgKndpcGh5LCBzdHJ1Y3QgCj4+PiB3aXJl
bGVzc19kZXYgKndkZXYpCj4+PiDCoHsKPj4+ICvCoMKgwqAgc3RydWN0IGllZWU4MDIxMV9zdWJf
aWZfZGF0YSAqc2RhdGE7Cj4+PiArwqDCoMKgIHN0cnVjdCBpZWVlODAyMTFfdmlmICpjaGlsZCwg
KnRtcDsKPj4+ICsKPj4+ICvCoMKgwqAgc2RhdGEgPSBJRUVFODAyMTFfV0RFVl9UT19TVUJfSUYo
d2Rldik7Cj4+PiArwqDCoMKgIGlmIChzZGF0YS0+dmlmLnR5cGUgPT0gTkw4MDIxMV9JRlRZUEVf
QVApIHsKPj4gSGkgSm9obiwgT2JzZXJ2ZWQgYSBOVUxMIHB0ciBkZXJlZmVyZW5jZSBlcnJvciBo
ZXJlLi4KPj4gCj4+IFRoYW5rcwo+PiBQcmFkZWVwCj4gCj4gCj4gaG93IGRpZCB5b3UgdHJpZ2dl
ciBpdCA/Cj4gCj4gwqDCoMKgIEpvaG4KSGkKCkRlbGV0ZWQgdGhlIGludGVyZmFjZSBhbmQgZGlk
IHJtbW9kIGFuZCBpbnNtb2Qgb2YgY2ZnODAyMTEvbWFjODAyMTEvYXRoIAptb2R1bGVzLgoKWyAg
ODgzLjU2NTkzM10gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJl
bmNlIGF0IAp2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAKWyAgODgzLjU2NTk3MF0gcGdkID0gYjMx
MWMwMDAKWyAgODgzLjU3MzM1N10gWzAwMDAwMDAwXSAqcGdkPTAwMDAwMDAwClsgIDg4My41Nzkw
MjFdIEludGVybmFsIGVycm9yOiBPb3BzOiA1IFsjMV0gUFJFRU1QVCBTTVAgQVJNClsgIDg4My44
NDgyNTddIHRhc2s6IGJkMWFjNjAwIHRpOiBiMDI3YTAwMCB0YXNrLnRpOiBiMDI3YTAwMApbICA4
ODMuODUyOTA0XSBQQyBpcyBhdCBpZWVlODAyMTFfZGVsX2lmYWNlKzB4MzQvMHg5MCBbbWFjODAy
MTFdClsgIDg4My44NTgzMzNdIExSIGlzIGF0IGV4dGFja19kb2l0KzB4MjAvMHg2YyBbY29tcGF0
XQpbICA4ODQuMDkyOTM2XSBbPGM3NTFmYmQ4Pl0gKGllZWU4MDIxMV9kZWxfaWZhY2UgW21hYzgw
MjExXSkgZnJvbSAKWzw3ZjU2MTgxYz5dIChleHRhY2tfZG9pdCsweDIwLzB4NmMgW2NvbXBhdF0p
ClsgIDg4NC4xMDA5OTFdIFs8N2Y1NjE4MWM+XSAoZXh0YWNrX2RvaXQgW2NvbXBhdF0pIGZyb20g
Wzw4MDc2YTM0MD5dIAooZ2VubF9yY3ZfbXNnKzB4MjdjLzB4MzAwKQpbICA4ODQuMTEwODU0XSBb
PDgwNzZhMzQwPl0gKGdlbmxfcmN2X21zZykgZnJvbSBbPDgwNzY5NmMwPl0gCihuZXRsaW5rX3Jj
dl9za2IrMHg1OC8weGI0KQoKVGhhbmtzClByYWRlZXAKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
