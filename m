Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502D4C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bY3FttwEdSJ1jfN38uigQhQ3lfPg6n6W5pl/SkKam2Y=; b=QUCGRiBXZC/fzN
	fzmPkFvMCuXQxxDDRszvBJCuKdHmShUMaEgzg8bKY3pGMM0RFHW0GkdJIyv8B77i2uKtLk25Z7H10
	AMX+sSG47gLka+PEkFokJaZdYqZeeJRqesHHqXe335WGmpseyhGSy0VPWeLghEI7mI/Y3c5mz3Vq3
	2/2mZEa9CRSL0rzllBnH0RKkTiPdh8G6XM7LZet/5I+/8rlH440xYYdWgiubPV7mpa+nA9pIzcuHn
	J/XwWa7V7mwhMxTEYMyhHPZsgLY85tAxbPYO5M4P5WJODkPtuZPgPspbdCWYe2k9RYF/4a4YgmZeX
	7q/iaXkj6/0RNK4ef2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YUu-00ECfE-2G;
	Mon, 13 Nov 2023 15:05:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YUr-00ECeR-10
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 15:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 08332B80DF7;
	Mon, 13 Nov 2023 15:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C94C433C8;
	Mon, 13 Nov 2023 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699887901;
	bh=cxxt0RjIfFF/CZhpHwC7zVqe2rTl2Bif9faDu5W+QQo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YXPy9grA/RP4gMtMDyE9Xj44btD0R5Xy2oTYOU7P03GZ7MngwvlFRa6jyQ5TL9P4M
	 5s6g4vkxg5uShUwBhspOZlzivnwWp2cXUu0Ka5tpRaEBUS+5TmmTFThQim6xAeKEMu
	 1041lup5dheOQRc9VfWYVcilZWlUq4E+CkMRsbBuR4/uMLwK/eMB6eEEZXeF6C4KbX
	 6qSssX5F+xgt7z9bosHgtA+fa898erKOh+FgmOyrVBl7ElckBWqu6ndTwlQUYtEd5h
	 6ymtIcmv7M2XSsbVnYS7nSuRS38TXNIbNqMRSGhv3m6MGJrmyyqqNRNFTbdqDQ13jF
	 C8J/Cr3vZuKog==
From: Kalle Valo <kvalo@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <mhi@lists.linux.dev>,
  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH RFC 4/8] wifi: ath11k: remove MHI LOOPBACK channels
References: <20231110102202.3168243-1-kvalo@kernel.org>
	<20231110102202.3168243-5-kvalo@kernel.org>
	<f56bce13-bba8-40d2-1dfc-210478ff63d6@quicinc.com>
	<e2ad1380-d55f-42bd-9f40-ef8aa6e0f105@quicinc.com>
	<818fddb9-b59e-7a6f-6605-2ba016d0db60@quicinc.com>
	<87msvhu4d5.fsf@kernel.org>
	<fb3709a6-95d2-711f-3ca1-0107fa159c62@quicinc.com>
Date: Mon, 13 Nov 2023 17:04:58 +0200
In-Reply-To: <fb3709a6-95d2-711f-3ca1-0107fa159c62@quicinc.com> (Jeffrey
	Hugo's message of "Mon, 13 Nov 2023 07:26:46 -0700")
Message-ID: <87il65u21x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_070505_860495_8E8093AD 
X-CRM114-Status: GOOD (  14.91  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SmVmZnJleSBIdWdvIDxxdWljX2podWdvQHF1aWNpbmMuY29tPiB3cml0ZXM6Cgo+IE9uIDExLzEz
LzIwMjMgNzoxNSBBTSwgS2FsbGUgVmFsbyB3cm90ZToKPgo+PiBKZWZmcmV5IEh1Z28gPHF1aWNf
amh1Z29AcXVpY2luYy5jb20+IHdyaXRlczoKPj4gCj4+PiBPbiAxMS8xMS8yMDIzIDk6MjQgUE0s
IEJhb2NoZW4gUWlhbmcgd3JvdGU6Cj4+Pgo+Pj4+IE9uIDExLzExLzIwMjMgMTI6NTQgQU0sIEpl
ZmZyZXkgSHVnbyB3cm90ZToKPj4+Pj4gT24gMTEvMTAvMjAyMyAzOjIxIEFNLCBLYWxsZSBWYWxv
IHdyb3RlOgo+Pj4+Pj4gRnJvbTogQmFvY2hlbiBRaWFuZyA8cXVpY19icWlhbmdAcXVpY2luYy5j
b20+Cj4+Pj4+Pgo+Pj4+Pj4gVGhlcmUgaXMgbm8gZHJpdmVyIHRvIG1hdGNoIHRoZXNlIHR3byBj
aGFubmVscywgc28KPj4+Pj4+IHJlbW92ZSB0aGVtLiBUaGlzIGZpeGVzIHdhcm5pbmdzIGZyb20g
TUhJIHN1YnN5c3RlbSBkdXJpbmcgc3VzcGVuZDoKPj4+Pj4+Cj4+Pj4+PiBtaGkgbWhpMF9MT09Q
QkFDSzogMTogRmFpbGVkIHRvIHJlc2V0IGNoYW5uZWwsIHN0aWxsIHJlc2V0dGluZwo+Pj4+Pj4g
bWhpIG1oaTBfTE9PUEJBQ0s6IDA6IEZhaWxlZCB0byByZXNldCBjaGFubmVsLCBzdGlsbCByZXNl
dHRpbmcKPj4+Pj4KPj4+Pj4gVGhpcyBmZWVscyBsaWtlIGp1c3QgbWFza2luZyBhIHJlYWwgaXNz
dWUuCj4+Pj4+Cj4+Pj4+IElmIExPT1BCQUNLIGlzIG5vdCBiZWluZyBjb25zdW1lZCwgdGhlbiB0
aGUgY2hhbm5lbCBzaG91bGQgbmV2ZXIgZ28KPj4+Pj4gaW50byB0aGUgc3RhcnQgc3RhdGUuwqAg
V2h5IHdvdWxkIHdlIGJlIHRyeWluZyB0byB0cmFuc2l0aW9uIHRvIHRoZQo+Pj4+PiByZXNldCBz
dGF0ZSB0aGVuPwo+Pj4+Pgo+Pj4+PiAtSmVmZgo+Pj4+IFRoYXQgaXMgYmVjYXVzZSwgd2l0aCBw
YXRjaCAnYnVzOiBtaGk6IGhvc3Q6IGFkZCBuZXcgaW50ZXJmYWNlcyB0bwo+Pj4+IGhhbmRsZSBN
SEkgY2hhbm5lbHMgZGlyZWN0bHknIGluIHRoaXMgcGF0Y2ggc2V0LCBhdGgxMWsgaXMgYWJsZSB0
bwo+Pj4+IGNhbGwgbWhpX3VucHJlcGFyZV9hbGxfZnJvbV90cmFuc2ZlcigpLCB3aGljaCB3aWxs
IHJlc2V0IGFsbAo+Pj4+IGNoYW5uZWxzLgo+Pj4KPj4+IHRoYXQgaW1wbGVtZW50YXRpb24gaXMg
Zmxhd2VkIGlmIGl0IGlzIGNhdXNpbmcgdGhpcy4gIExvb2tzIGxpa2UgeW91Cj4+PiBuZXZlciBj
aGVjayB0byBzZWUgaWYgdGhlIGNoYW5uZWwgd2FzIHByZXBhcmVkIGluIHRoZSBmaXJzdCBwbGFj
ZS4KPj4+Cj4+PiBJZiB5b3UgZ28gZml4IHRoYXQsIHRoZW4gaXQgbG9va3MgbGlrZSB0aGlzIGNo
YW5nZSBpcyBub3QgbmVlZGVkLgo+PiBCVFcgd2hhdCBkbyB0aGVzZSBsb29wYmFjayBjaGFubmVs
cyBkbz8gSSBkaWRuJ3Qgbm90aWNlIGFueQo+PiBkaWZmZXJlbmNlCj4+IGluIHRoZSBmdW5jdGlv
bmFsaXR5IHNvIEknbSB3b25kZXJpbmcgdGhlIHJlYXNvbiBmb3IgdGhlc2UuCj4+IAo+Cj4gVGhl
IGxvb3BiYWNrIGNoYW5uZWwgaXMgZGVmaW5lZCBhcyBhIHNlcnZpY2Ugd2hlcmUgYW55IGRhdGEg
dGhlIGhvc3QKPiBzZW5kcyB0byB0aGUgZGV2aWNlIGlzIGltbWVkaWF0ZWx5IHNlbnQgYmFjayB0
byB0aGUgaG9zdCwgdW5tb2RpZmllZC4KPiBUaGUgdHlwaWNhbCB1c2VjYXNlIGlzIHNtb2tlIHRl
c3QgYW5kIHBlcmZvcm1hbmNlIHByb2ZpbGluZy4KClRoYW5rcywgZ29vZCB0byBrbm93LiBXZSBk
b24ndCBoYXZlIGFueSBzdWNoIGZ1bmN0aW9uYWxpdHkgaW4gYXRoMTFrCnJpZ2h0IG5vdyBhbmQg
aWYgd2UgZXZlciBkbyB3ZSBjYW4gYWx3YXlzIGFkZCB0aGUgY2hhbm5lbHMgYmFjay4KCi0tIApo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8K
Cmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRh
dGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMWsK
