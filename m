Return-Path: <SRS0=TiPo=KO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C1FC433ED
	for <ath11k@archiver.kernel.org>; Wed, 19 May 2021 04:15:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BB0360FE4
	for <ath11k@archiver.kernel.org>; Wed, 19 May 2021 04:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BB0360FE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rj4E3KEZszVE2fFYD6zsjGwlny0xa+zbYcG97FH/TX0=; b=a0LiV/vqm51XeY9/WJr38E+Pa
	2tpCOTZ49WY18pXo62Lh1u83g37FBODzY8gIGed1tORskl1bZTSjpXtn4S/JRC5/XhDNhm0LfKtzh
	DANH3/Zo3dIwTvDY7Mro5wFPREx/Hi/O07Te7aSubFRNbFsrSVw4iuldK5fpExBhW/Ro3CTykRXsE
	sQKBOrqcmq+nmjgoYzibYtb38df8qejQqgFzfmkEZkw8Rnz0ZKudKpSg0+fd2RLOJ1N1SKMC11JZj
	gPmhOgrHf0ctCWr4+7XPV6X+p5HvH4sLhb7KBOgNaM6Y4P0yHJMnr5/wIFRFwCEm5R9+SU5UfUT4H
	szvrrOBHg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljDbs-002hUU-Fu; Wed, 19 May 2021 04:15:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDbr-002hTt-98
 for ath11k@desiato.infradead.org; Wed, 19 May 2021 04:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=EyXQfLJ8OrKTFEI6sOBS9yJnRmcGLyLhUoXPG6z9sa0=; b=xZdbzB9yysKsbJz/VvjAD+nV6x
 GrvWlkActBfkc9llS2FoefB4NIEd4tPakdPsAkTkATFO9KPAqHKtEmoxaQ5IS1gDvXcdFTKMBbSiF
 9QBw/GkD2BsjVzbQsRDVt90m0ULn2CpPNkGmhxdxWiX9ZgJxGP+JSdwr84hZn9T3ILRtdIS9BFMSy
 +zNdCBCNlGETEKK9w0/X2Cj9bfmuxDG2tx7oyrA76WEptFvWAT1tlz/3OToSMnE295adhhaGd2H35
 cXZc2koFmLJEBT6uk4q6yMe6HWY1BhHKrT/WhqIQ9PW43iyXXA9QozeCo58psyJLAt7CpBi4V/0ZL
 zc/kfNxQ==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDbo-00F76G-GG
 for ath11k@lists.infradead.org; Wed, 19 May 2021 04:15:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621397698; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EyXQfLJ8OrKTFEI6sOBS9yJnRmcGLyLhUoXPG6z9sa0=;
 b=ZiQ5lUQr1arQY+KQgL/Mmf6ZQLOpe1epbWuqsGLP7uBsAP6gpdixlHt6p6HWvZP/gSO94o35
 xLs17/x3hiXOUhNu2rw6hlr15funFJK4rwT0cRt7cERnJDDyhwpL35pra14Lc+VZ7GMdl7sh
 5w7NYaZO8pOqOggiKo1zT7vrp2E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60a490c1063320cd13604c15 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 May 2021 04:14:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2E1E5C4338A; Wed, 19 May 2021 04:14:57 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E83EC433F1;
 Wed, 19 May 2021 04:14:56 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 19 May 2021 12:14:56 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, Justin Mazzola Paluska <jmp@justinmp.com>
Subject: Re: ath11k: qca6390 firmware crashes while connecting to 160 MHz
 channel
In-Reply-To: <871rcz9m9j.fsf@codeaurora.org>
References: <87blew3e4q.fsf@codeaurora.org> <87blew3e4q.fsf@codeaurora.org>
 <054ddea6-639e-c21e-d404-d551c65128df@justinmp.com>
 <920c8cc9-21fb-b7aa-4b49-be7656fb14b5@justinmp.com>
 <f776233a-0ed6-1ebc-3d68-be4a88514736@justinmp.com>
 <874kkfozhp.fsf@codeaurora.org>
 <a170a87b-072d-dc8e-6833-231e0df5b23c@justinmp.com>
 <875z2yuafn.fsf_-_@codeaurora.org>
 <5fd39674-d513-c28e-5469-693d96e804c0@justinmp.com>
 <87k0rdste7.fsf@codeaurora.org>
 <ed6c2f2b-3f47-007f-9bdd-135514121aa5@justinmp.com>
 <af78423479f82ae460541ee3ab737121@codeaurora.org>
 <87czwj9umb.fsf@codeaurora.org>
 <ae28fa90b517a293d0a61278ceb834db@codeaurora.org>
 <871rcz9m9j.fsf@codeaurora.org>
Message-ID: <27c2bb587c61c7577aec462420e14986@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_211500_637615_F260A17F 
X-CRM114-Status: GOOD (  16.46  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMy0wMSAxODo1NSwgS2FsbGUgVmFsbyB3cm90ZToKPiBXZW4gR29uZyA8d2dvbmdA
Y29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPiAKPj4gT24gMjAyMS0wMy0wMSAxNTo1NCwgS2FsbGUg
VmFsbyB3cm90ZToKPj4+IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+
Pj4gCj4+Pj4gT24gMjAyMS0wMi0xNCAwMjozNiwgSnVzdGluIE1henpvbGEgUGFsdXNrYSB3cm90
ZToKPj4+Pj4gT24gMi8xMi8yMSAxOjE2IEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+Pj4+Pj4gSnVz
dGluIE1henpvbGEgUGFsdXNrYSA8am1wQGp1c3Rpbm1wLmNvbT4gd3JpdGVzOgo+Pj4+Pj4gCj4+
Pj4+Pj4gT24gMi8xMS8yMSA2OjEwIEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+Pj4+Pj4+PiAoY2hh
bmdpbmcgdGhlIHRpdGxlIHRvIGZpbmQgdGhpcyBlYXNpZXIpCj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBK
dXN0aW4gTWF6em9sYSBQYWx1c2thIDxqbXBAanVzdGlubXAuY29tPiB3cml0ZXM6Cj4+Pj4+Pj4+
IAo+Pj4+Pj4+Pj4gT24gMTIvMjEvMjAgMTI6MTEgUE0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+Pj4+
Pj4+Pj4+IE15IHJvdXRlciBzdXBwb3J0cyAxNjAgTUh6IGNoYW5uZWxzIGluIHRoZSA1IEdIeiBi
YW5kcyBbMV0uwqAgCj4+Pj4+Pj4+Pj4+IEkKPj4+Pj4+Pj4+Pj4gc3dpdGNoZWQgdGhlIHJvdXRl
ciB0byBhZHZlcnRpc2luZyA4MCBNSHogY2hhbm5lbHMgYW5kIHRoZQo+Pj4+Pj4+Pj4+PiBjYXJk
IGNvdWxkCj4+Pj4+Pj4+Pj4+IGNvbm5lY3QuCj4+Pj4+Pj4+Pj4gVGhhbmtzIGZvciB0aGUgZGV0
YWlsZWQgZGVidWdnaW5nLCB0aGlzIHNob3VsZCBoZWxwIHVzCj4+Pj4+Pj4+Pj4gcmVwcm9kdWNp
bmcgdGhlCj4+Pj4+Pj4+Pj4gcHJvYmxlbS4gV2hhdCdzIHRoZSBleGFjdCBvcGVud3J0IHZlcnNp
b24geW91IGFyZSB1c2luZz8KPj4+Pj4+Pj4+IFRoZSBPcGVuV1JUIHZlcnNpb24gaXM6Cj4+Pj4+
Pj4+PiAKPj4+Pj4+Pj4+IE9wZW5XcnQgMTkuMDcuNSByMTEyNTctNTA5MDE1MmFlMyAvIEx1Q0kg
b3BlbndydC0xOS4wNyBicmFuY2gKPj4+Pj4+Pj4+IGdpdC0yMC4zNDEuNTc2MjYtNTFmNTViNQo+
Pj4+Pj4+Pj4gCj4+Pj4+Pj4+PiAoVGhpcyBpcyB0aGUgbGF0ZXN0IHN0YWJsZSByZWxlYXNlLikK
Pj4+Pj4+Pj4gVGhhbmtzLiBJIGdvdCBhIHJlcG9ydCB0aGF0IHRoaXMgbWlnaHQgYmUgZHVlIHRv
IGNvbW1pdAo+Pj4+Pj4+PiAzNTc5OTk0NDc2YjYKPj4+Pj4+Pj4gKCJ3aXJlbGVzczogZml4IHdy
b25nIDE2MC84MCs4MCBNSHogc2V0dGluZyIpLiBDYW4geW91IHRyeQo+Pj4+Pj4+PiByZXZlcnRp
bmcgdGhlCj4+Pj4+Pj4+IGNvbW1pdCBqdXN0IHRvIGNvbmZpcm0gd2UgYXJlIHNlZWluZyB0aGUg
c2FtZSBpc3N1ZT8KPj4+Pj4+PiBJIHdpbGwgdHJ5IG92ZXIgdGhlIHdlZWtlbmQuwqAgU2hhbGwg
SSBzdGlsbCB1c2UgdGhlCj4+Pj4+Pj4gYXRoMTFrLXFjYTYzOTAtYnJpbmd1cCBicmFuY2ggb3Ig
c29tZXRoaW5nIGVsc2U/wqAgKEknbSBzdGlsbAo+Pj4+Pj4+IHJ1bm5pbmcKPj4+Pj4+PiB0aGUg
YXRoMTFrLXFjYTYzOTAtYnJpbmd1cCBicmFuY2ggb24gbXkgbGFwdG9wKS4KPj4+Pj4+IFllcywg
dXNlIHRoZSBzYW1lIGJyYW5jaC4gTGVhc3QgYW1vdW50IG9mIGNoYW5nZXMgdGhhdCB3YXkuCj4+
Pj4+IAo+Pj4+PiBJIHJldmVydGVkIDM1Nzk5OTQ0NzZiNiBhbmQgcmUtZW5hYmxlZCAxNjAgTUh6
IGNoYW5uZWxzIG9uIG15Cj4+Pj4+IHJvdXRlci7CoAo+Pj4+PiBJIHdhcyBhYmxlIHRvIGNvbm5l
Y3QgdG8gbXkgcm91dGVyIHVzaW5nIHRoZSA1IEdIeiBiYW5kIGF0IDgwIE1IeiAKPj4+Pj4gKGFz
Cj4+Pj4+IGV4cGVjdGVkKS4KPj4+Pj4gCj4+Pj4+IEl0IHNlZW1zIHRoYXQgcmV2ZXJ0aW5nIDM1
Nzk5OTQ0NzZiNiBmaXhlZCB0aGUgZmlybXdhcmUgY3Jhc2ggd2l0aAo+Pj4+PiAxNjAKPj4+Pj4g
TUh6IGNoYW5uZWxzIQo+Pj4+PiAKPj4+Pj4gSSdsbCBsZWF2ZSBteSByb3V0ZXIgaW4gMTYwIE1I
eiBtb2RlIGZvciBhIHdoaWxlIHRvIHNlZSBpZiB0aGVyZSAKPj4+Pj4gYXJlCj4+Pj4+IGFueSBw
cm9ibGVtcyB0aGF0IGNyb3AgdXAgb3ZlciB0aW1lLgo+Pj4+IAo+Pj4+IERvZXMgYW55b25lIHRy
eWluZyByZXZlcnQgdGhpcyBwYXRjaCgzNTc5OTk0NDc2YjYgd2lyZWxlc3M6IGZpeCAKPj4+PiB3
cm9uZwo+Pj4+IDE2MC84MCs4MCBNSHogc2V0dGluZykgdXBzdHJlYW0/Cj4+PiAKPj4+IFllcywg
SnVzdGluIHJlcG9ydHMgYWJvdmUgdGhhdCBoZSByZXZlcnRlZCBjb21taXQgMzU3OTk5NDQ3NmI2
IGFuZCAKPj4+IHRoZQo+Pj4gZmlybXdhcmUgZGlkIG5vdCBjcmFzaCBhZnRlciB0aGF0Lgo+PiAK
Pj4gSSBrbm93IHRoYXQuIEhhcyBzb21lb25lIHNlbnQgcGF0Y2ggdG8gcmV2ZXJ0IGl0IGluIHB1
YmxpYz8KPiAKPiBJIGRvbid0IHJlY2FsbCBzZWVpbmcgYW55IHJldmVydHMgZm9yIHRoaXMuCkRv
ZXMgdGhlIHFjYTYzOTAgZmlybXdhcmUgY3Jhc2hlcyBpc3N1ZSBmaXhlZCBub3cgaW4gdXBzdHJl
YW0/Ckkgc2VlIHRoaXMgcGF0Y2goMzU3OTk5NDQ3NmI2IHdpcmVsZXNzOiBmaXggd3JvbmcgMTYw
LzgwKzgwIE1IeiBzZXR0aW5nKSAKbm90IHJldmVydCBpbiB1cHN0cmVhbS4KCi0tIAphdGgxMWsg
bWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
