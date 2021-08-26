Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBBAC432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 14:38:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79DAC60FD8
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 14:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79DAC60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nF/PTYyAHSX4EJhdcky2pwDNU37s6z/BTujxupjyVY8=; b=tg1dyC5B0zIqlj
	eIdxkpa5YRj5+mrEB8hW40bGrf2DggLpsz6xwui1fmgeFErmbz55wva9LJ/IcDH6TSrFlPUdTCeue
	KnMG/vJtRRznSBJHkqanx9U5OKJvmVr8KOKUHWPkEwOHHOeXxp0nvJQl05zPTkO67tMEWCz3BV8UH
	t7/DeZ2pk1ot6GtCwIeguPKV+VckRKemCaRciHJuJJXGfglvLlVcvgCYZaSKbejkBxB5bFhiHeyyL
	Y5pOnUqlONern9WaYaRhx+hKTBzpWNR5SQTeLzjghxoUc0Oi6uhABLAXyHVVjk775Ps6DPlzgCKX2
	oYV3pVjz0x9c+1eM7+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJGWi-00AOCC-Ga; Thu, 26 Aug 2021 14:38:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJGWd-00AOAt-41
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 14:38:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9409261027;
 Thu, 26 Aug 2021 14:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629988718;
 bh=hENEpileTUK7xnFY44JId6KBZv8d7ZlqXE+OKdAQKDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uijFCrg68CeGFmPoqmagkalMujlkMDFRA5rIEOBYbubddWh0omcHTESLQk7mLOsPK
 yG5fDXYAOaMUJuFlWgtWlrwgceOuAzl65ylnDnLEkExGwia7KsWYBHW8rdW/MIsBo1
 UMCYg0PNujDOHph+l1zianvriMQ2QG4kPyID1OaA=
Date: Thu, 26 Aug 2021 16:38:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Wren Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Nicolas Schichan <nschichan@freebox.fr>
Subject: Re: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
Message-ID: <YSenaxWzxRkYkucv@kroah.com>
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
 <87tujgqcth.fsf@codeaurora.org> <87mtp47073.fsf_-_@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mtp47073.fsf_-_@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_073839_239603_8EE71983 
X-CRM114-Status: GOOD (  31.20  )
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

T24gVGh1LCBBdWcgMjYsIDIwMjEgYXQgMDU6MjU6MDRQTSArMDMwMCwgS2FsbGUgVmFsbyB3cm90
ZToKPiAoQWRkaW5nIExpbnVzIGFuZCBHcmVnKQo+IAo+IEthbGxlIFZhbG8gPGt2YWxvQGNvZGVh
dXJvcmEub3JnPiB3cml0ZXM6Cj4gCj4gPiAoQWRkaW5nIERhdmUgYW5kIEpha3ViIHRvIENDKQo+
ID4KPiA+IE5pY29sYXMgU2NoaWNoYW4gPG5zY2hpY2hhbkBmcmVlYm94LmZyPiB3cml0ZXM6Cj4g
Pgo+ID4+IE9uIDIzLzA4LzIwMjEgMTQ6NTMsIEthbGxlIFZhbG8gd3JvdGU6Cj4gPj4+IChhZGRp
bmcgbGludXgtd2lyZWxlc3MsIHJlZ3Jlc3Npb25zIGFuZCBzb21lIG1oaSBmb2xrcykKPiA+Pj4g
Cj4gPj4+IFdyZW4gVHVya2FsIDx3dEBwZW5ndWludGVjaHMub3JnPiB3cml0ZXM6Cj4gPj4+IAo+
ID4+Pj4gSSBoYXZlIG5vIGRldmljZSBmb3IgdGhlIHdpZmkgb24gbXkgY29tcHV0ZXIuIDUuMTMg
d29ya2VkIHByZXR0eSB3ZWxsLgo+ID4+Pj4gSSBhbHNvIGZvdW5kIG90aGVycyByZXBvcnRpbmcg
c2ltaWxhciBpc3N1ZXM6Cj4gPj4+PiBodHRwczovL2ZvcnVtLm1hbmphcm8ub3JnL3Qva2VybmVs
NS0xNC1yYzYtYXRoMTFrLW9uLXFjYTYzOTAtcmVncmVzc2lvbi1taGktcHJvYmUtZmFpbHVyZS83
OTM2Mgo+ID4+Pj4KPiA+Pj4+IEhlcmUncyBpbmZvIGFib3V0IHRoZSBoYXJkd2FyZSBvbiBteSBs
YXB0b3A6Cj4gPj4+PiDinpwgIH4gc3VkbyBkbWlkZWNvZGUgLXMgc3lzdGVtLXByb2R1Y3QtbmFt
ZQo+ID4+Pj4gWFBTIDEzIDkzMTAKPiA+Pj4+Cj4gPj4+PiDinpwgIH4gc3VkbyBkbWlkZWNvZGUg
LXMgYmlvcy12ZXJzaW9uCj4gPj4+PiAzLjAuNAo+ID4+PiAKPiA+Pj4gRG8geW91IGdldCB0aGUg
c2FtZSBtaGkgZXJyb3IgYXMgaW4gdGhlIGZvcnVtIHBvc3Q/Cj4gPj4+IAo+ID4+PiBxY29tX21o
aV9xcnRyOiBwcm9iZSBvZiBtaGkwX0lQQ1IgZmFpbGVkIHdpdGggZXJyb3IgLTIyCj4gPj4+IAo+
ID4+PiBNSEkgZm9sa3MsIGFueSBpZGVhcz8gSSBoYXZlIFhQUyAxMyA5MzEwIG15c2VsZiBidXQg
SSdtIG5vdCBhYmxlIHRvIHRlc3QKPiA+Pj4gdjUuMTQtcmM2IGtlcm5lbCByaWdodCBub3cuCj4g
Pj4KPiA+PiBIZWxsbywKPiA+Pgo+ID4+IEkgaGF2ZSBoaXQgdGhlIHNhbWUgaXNzdWUgb24gTGlu
dXggNS4xNC1yYzc6Cj4gPj4KPiA+PiBbICAgMTQuNzgwNTY2XSBxY29tX21oaV9xcnRyOiBwcm9i
ZSBvZiBtaGkwX0lQQ1IgZmFpbGVkIHdpdGggZXJyb3IgLTIyCj4gPj4KPiA+PiBUaGlzIGxvb2tz
IHRvIGJlIGNhdXNlZCBieSBjb21taXQ6Cj4gPj4KPiA+PiBjZTc4ZmZhM2VmMTYgbmV0OiByZWFs
bHkgZml4IHRoZSBidWlsZC4uLgo+ID4+Cj4gPj4gUmV2ZXJ0aW5nIHRoaXMgY29tbWl0IHJlc3Vs
dHMgaW4gYXRoMTFrIGJlaW5nIGFibGUgdG8gbG9hZCB3aXRob3V0IGVycm9ycy4KPiA+Cj4gPiBU
aGFua3MsIHRoaXMgaGVscHMgYSBsb3QuIENvbW1pdCBjZTc4ZmZhM2VmMTYgd2FzIGludHJvZHVj
ZWQgaW4KPiA+IHY1LjE0LXJjNSBzbyBJIGFzc3VtZSB0aGF0J3MgdGhlIGZpcnN0IHJlbGVhc2Ug
d2hpY2ggYnJva2UgYXRoMTFrLgo+ID4KPiA+IERhdmUsIHdoYXQgYnVpbGQgaXNzdWUgZGlkIHlv
dSBmaXggd2l0aCBjb21taXQgY2U3OGZmYTNlZjE2PyBDb3VsZCB3ZQo+ID4gcmV2ZXJ0IHRoZSBj
b21taXQ/IFRoZSBwcm9ibGVtIGlzIHRoYXQsIHVubGVzcyB3ZSBmaXggdGhpcyBpc3N1ZSwgd2l0
aAo+ID4gdjUuMTQgV0xBTiB3aWxsIGJlIGJyb2tlbiBvbiBhIHF1aXRlIGZldyBuZXdlciBEZWxs
IGxhcHRvcHMuCj4gCj4gSSBkaWQgc29tZSBpbnZlc3RpYXRpb24gYW5kIEkgc3VzcGVjdCB0aGF0
IGNvbW1pdCBjZTc4ZmZhM2VmMTYgKCJuZXQ6Cj4gcmVhbGx5IGZpeCB0aGUgYnVpbGQuLi4iKVsx
XSBpcyBmb3IgaGFuZGxpbmcgYSBjb25mbGljdCBiZXR3ZWVuIG5ldC1uZXh0Cj4gYW5kIGNoYXIt
bWlzYy1uZXh0IHRyZWVzIHJlbGF0ZWQgdG8gTG9pYydzIGNvbW1pdCAwMDkyYTFlM2Y3NjMgKCJi
dXM6Cj4gbWhpOiBBZGQgaW5ib3VuZCBidWZmZXJzIGFsbG9jYXRpb24gZmxhZyIpLiBHcmVnIG1l
bnRpb25zIHRoaXMgaW4gYQo+IGNvbW1pdFsyXToKPiAKPiBjb21taXQgODEzMjcyZWQ1MjM4YjM3
YzgxZTQ0OGIzMDIwNDhlODAwODU3MDEyMQo+IE1lcmdlOiBkZTA1MzRkZjkzNDcgMzZhMjFkNTE3
MjVhCj4gQXV0aG9yOiAgICAgR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KPiAKPiAgICAgTWVyZ2UgNS4xNC1yYzUgaW50byBjaGFyLW1pc2MtbmV4dAo+ICAg
ICAKPiAgICAgV2UgbmVlZCB0aGUgZml4ZXMgaW4gaGVyZSBhcyB3ZWxsLCBhbmQgcmVzb2x2ZXMg
c29tZSBtZXJnZSBpc3N1ZXMgd2l0aAo+ICAgICB0aGUgbWhpIGNvZGViYXNlLgo+IAo+IElmIG15
IGFzc3VtcHRpb24gaXMgY29ycmVjdCB3aGVuIEkgcHJvcG9zZSB0aGF0IHdlIHJldmVydCBjb21t
aXQKPiBjZTc4ZmZhM2VmMTYgZm9yIHY1LjE0LCBBRkFJQ1MgaXQncyBub3QgcmVhbGx5IG5lZWRl
ZCBmb3IgdjUuMTQgKGNvbW1pdAo+IDAwOTJhMWUzZjc2MyBpcyBpbiAtbmV4dCwgbm90IGluIExp
bnVzJyB0cmVlIHlldCkgYW5kIGNvbW1pdAo+IGNlNzhmZmEzZWYxNiBicmVha3MgYXRoMTFrLiBB
bmQgdGhlIGNvbmZsaWN0IGJldHdlZW4gbmV0LW5leHQgYW5kCj4gY2hhci1taXNjLW5leHQgY2Fu
IGJlIHRoZW4gbGF0ZXIgZml4ZWQgZHVyaW5nIHRoZSBtZXJnZSB3aW5kb3cuCj4gCj4gV2lsbCB0
aGlzIHdvcmsgZm9yIGV2ZXJ5b25lPyBJZiBubyBvYmplY3Rpb25zLCBJJ2xsIHN1Ym1pdCB0aGUg
cmV2ZXJ0IHRvCj4gTGludXMgbGF0ZXIgdG9kYXkuIFdlIGFyZSBnZXR0aW5nIHJlYWxseSBjbG9z
ZSB0byBmaW5hbCB2NS4xNCByZWxlYXNlIHNvCj4gbm90IG11Y2ggdGltZSBsZWZ0IHRvIGZpeCB0
aGlzLgo+IAo+IEp1c3QgdG8gcmVpdGVyYXRlIHdoeSB0aGUgdXJnZW5jeTogY29tbWl0IGNlNzhm
ZmEzZWYxNiBicm9rZSBhdGgxMWsgaW4KPiB2NS4xNC1yYzUsIHVzZXJzIGhhdmUgcmVwb3J0ZWQg
KGFuZCBJIGhhdmUgY29uZmlybWVkKSB0aGF0IGF0IGxlYXN0Cj4gUUNBNjM5MCBzdXBwb3J0IGlz
IGJyb2tlbiBidXQgSSBzdXNwZWN0IGFsbCBRdWFsY29tbSBXaS1GaSA2IGRldmljZXMKPiBzdXBw
b3J0ZWQgYnkgYXRoMTFrIGFyZSBjdXJyZW50bHkgYnJva2VuLgoKTm8gb2JqZWN0aW9uIGZyb20g
bWUgZm9yIHJldmVydGluZyB0aGF0LCBpZiBpdCBmaXhlcyB0aGUgcHJvYmxlbXMgeW91CmFyZSBz
ZWVpbmcgZm9yIDUuMTQtZmluYWwuCgpUaGUgZ29hbCB3YXMgZm9yIHRoZSBtaGkgY2hhbmdlcyB0
byBnbyB0aHJvdWdoIHRoZSBuZXR3b3JraW5nIHRyZWUgaW4KdGhlIGZpcnN0IHBsYWNlLCBJIGRv
bid0IHNlZSBob3cgdGhpcyBnb3Qgb3V0IG9mIHN5bmMuCgpJZiB0aGlzIGlzIHJldmVydGVkLCBz
b21lIGhlbHAgb24gaG93IHRvIHJlc29sdmUgdGhlIG1lcmdlIGlzc3VlcyBpdAp3aWxsIGNhdXNl
IHdvdWxkIGJlIGFwcHJlY2lhdGVkLgoKdGhhbmtzLAoKZ3JlZyBrLWgKCi0tIAphdGgxMWsgbWFp
bGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
