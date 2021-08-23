Return-Path: <SRS0=q65b=NO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC94DC4338F
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 17:43:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E66C610C7
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 17:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E66C610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2Bvd0T2M5dT3gHHD/d9fSv13o9gBx1v4mALrtLNG/c=; b=qzLHzyhDfzxlk8
	qTXBQPk4aJuLYrao3wXz3pdRwKAvri7sqnm++0Ai7PIJOHzr1YUvUeF8Da2LYQ/QjpqMYO9QNeClE
	iFpb7FvK6wuU71o+Zqef/8NjGSslW0ybsN6z3XZbpol6zHUhIxrruTezSSMvY3In8rwiJy6XwwVws
	cqTAhQO3Gt9zGKpBhg6puJOgIXPUsl6byHs/p1XJZ+RhnhEguUXZhVOXna0F0eGvthwOrJKj6rv0X
	92bDiA0YjE+66HYCjj2UIJ62sUGfKZcZ9P3b5B84mmKjhIOxeIrptwfbJKiz3QVZTRR9SWzvflSVU
	pQYfyKpjkWPCl4acstEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIDyy-000DKS-5Y; Mon, 23 Aug 2021 17:43:36 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIDyh-000DGH-VH
 for ath11k@lists.infradead.org; Mon, 23 Aug 2021 17:43:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629740610; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=T0WPNhMpwf31Yqfe1WoISD46XNqfHSpKpAZp0ydFo3U=;
 b=BAumPdxdxDBXWbjclbGe6bb6HpumBIvKSUtyTlND5bTquDt15IpnK2Dkv9Hn7zRe+8SioxZO
 ArHW/qQaxdu+rly/YVkSXF2IQGFumeoJSJteGizLc+vWbkDK+OcHsmA3w366tJrAIeJ0/16r
 QSqaM7kJibb9ZVWTFkCu43PMw0o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6123dda589fbdf3ffe5dcbdf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 17:40:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2984FC4361A; Mon, 23 Aug 2021 17:40:52 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 64E70C4360C;
 Mon, 23 Aug 2021 17:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 64E70C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: Wren Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 David S. Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
Date: Mon, 23 Aug 2021 20:40:42 +0300
In-Reply-To: <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr> (Nicolas
 Schichan's message of "Mon, 23 Aug 2021 18:02:33 +0200")
Message-ID: <87tujgqcth.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_104331_041792_D15B55E4 
X-CRM114-Status: GOOD (  15.59  )
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

KEFkZGluZyBEYXZlIGFuZCBKYWt1YiB0byBDQykKCk5pY29sYXMgU2NoaWNoYW4gPG5zY2hpY2hh
bkBmcmVlYm94LmZyPiB3cml0ZXM6Cgo+IE9uIDIzLzA4LzIwMjEgMTQ6NTMsIEthbGxlIFZhbG8g
d3JvdGU6Cj4+IChhZGRpbmcgbGludXgtd2lyZWxlc3MsIHJlZ3Jlc3Npb25zIGFuZCBzb21lIG1o
aSBmb2xrcykKPj4gCj4+IFdyZW4gVHVya2FsIDx3dEBwZW5ndWludGVjaHMub3JnPiB3cml0ZXM6
Cj4+IAo+Pj4gSSBoYXZlIG5vIGRldmljZSBmb3IgdGhlIHdpZmkgb24gbXkgY29tcHV0ZXIuIDUu
MTMgd29ya2VkIHByZXR0eSB3ZWxsLgo+Pj4gSSBhbHNvIGZvdW5kIG90aGVycyByZXBvcnRpbmcg
c2ltaWxhciBpc3N1ZXM6Cj4+PiBodHRwczovL2ZvcnVtLm1hbmphcm8ub3JnL3Qva2VybmVsNS0x
NC1yYzYtYXRoMTFrLW9uLXFjYTYzOTAtcmVncmVzc2lvbi1taGktcHJvYmUtZmFpbHVyZS83OTM2
Mgo+Pj4KPj4+IEhlcmUncyBpbmZvIGFib3V0IHRoZSBoYXJkd2FyZSBvbiBteSBsYXB0b3A6Cj4+
PiDinpwgIH4gc3VkbyBkbWlkZWNvZGUgLXMgc3lzdGVtLXByb2R1Y3QtbmFtZQo+Pj4gWFBTIDEz
IDkzMTAKPj4+Cj4+PiDinpwgIH4gc3VkbyBkbWlkZWNvZGUgLXMgYmlvcy12ZXJzaW9uCj4+PiAz
LjAuNAo+PiAKPj4gRG8geW91IGdldCB0aGUgc2FtZSBtaGkgZXJyb3IgYXMgaW4gdGhlIGZvcnVt
IHBvc3Q/Cj4+IAo+PiBxY29tX21oaV9xcnRyOiBwcm9iZSBvZiBtaGkwX0lQQ1IgZmFpbGVkIHdp
dGggZXJyb3IgLTIyCj4+IAo+PiBNSEkgZm9sa3MsIGFueSBpZGVhcz8gSSBoYXZlIFhQUyAxMyA5
MzEwIG15c2VsZiBidXQgSSdtIG5vdCBhYmxlIHRvIHRlc3QKPj4gdjUuMTQtcmM2IGtlcm5lbCBy
aWdodCBub3cuCj4KPiBIZWxsbywKPgo+IEkgaGF2ZSBoaXQgdGhlIHNhbWUgaXNzdWUgb24gTGlu
dXggNS4xNC1yYzc6Cj4KPiBbICAgMTQuNzgwNTY2XSBxY29tX21oaV9xcnRyOiBwcm9iZSBvZiBt
aGkwX0lQQ1IgZmFpbGVkIHdpdGggZXJyb3IgLTIyCj4KPiBUaGlzIGxvb2tzIHRvIGJlIGNhdXNl
ZCBieSBjb21taXQ6Cj4KPiBjZTc4ZmZhM2VmMTYgbmV0OiByZWFsbHkgZml4IHRoZSBidWlsZC4u
Lgo+Cj4gUmV2ZXJ0aW5nIHRoaXMgY29tbWl0IHJlc3VsdHMgaW4gYXRoMTFrIGJlaW5nIGFibGUg
dG8gbG9hZCB3aXRob3V0IGVycm9ycy4KClRoYW5rcywgdGhpcyBoZWxwcyBhIGxvdC4gQ29tbWl0
IGNlNzhmZmEzZWYxNiB3YXMgaW50cm9kdWNlZCBpbgp2NS4xNC1yYzUgc28gSSBhc3N1bWUgdGhh
dCdzIHRoZSBmaXJzdCByZWxlYXNlIHdoaWNoIGJyb2tlIGF0aDExay4KCkRhdmUsIHdoYXQgYnVp
bGQgaXNzdWUgZGlkIHlvdSBmaXggd2l0aCBjb21taXQgY2U3OGZmYTNlZjE2PyBDb3VsZCB3ZQpy
ZXZlcnQgdGhlIGNvbW1pdD8gVGhlIHByb2JsZW0gaXMgdGhhdCwgdW5sZXNzIHdlIGZpeCB0aGlz
IGlzc3VlLCB3aXRoCnY1LjE0IFdMQU4gd2lsbCBiZSBicm9rZW4gb24gYSBxdWl0ZSBmZXcgbmV3
ZXIgRGVsbCBsYXB0b3BzLgoKVW5mb3J0dW5hdGVseSBJJ20gdHJhdmVsbGluZyByaWdodCBub3cg
YW5kIEknbSBub3QgYWJsZSB0byBsb29rIGF0IHRoaXMKaW4gZGV0YWlsIHVudGlsIFRodXJzZGF5
IG9yIHNvLiBBbmQgSSBhc3N1bWUgTGludXMgd2lsbCBtYWtlIHRoZSBmaW5hbAp2NS4xNCByZWxl
YXNlIG9uIFN1bmRheSBzbyB3ZSBhcmUgb24gYSB0aWdodCBzY2hlZHVsZSA6LwoKLS0gCmh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0
cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9u
L3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDExawo=
