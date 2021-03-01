Return-Path: <SRS0=Rum7=H7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0974AC433E0
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 07:22:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCA7F64DEE
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 07:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCA7F64DEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BebUrXuVbHKypD7gJAY+Vt6Huf+2o5BzTtslRpWv9Wc=; b=3hWiaLRHU4C6JYhmWFPQIqwvU
	G0WuJwSRR3/791wFHNw7v2yGnMFzbBAfjSHXAnNPAiWDMtutx61hUHw8QHps6s1DKcL5dvgVcNtbT
	RMe+WuuREwI4AJJOR/6zAX3/Z7QbzqyXdv4V7Qx2rpFfqHDElxJ1svJeLKdZhdSSIoJ4ckzUkagq2
	77l0EvHdmLCHehNNkASRldLVqwDdSf9DFKmOW/Haw7Xl//b8beJizNvG6Da3tNIDCJPz8bd6WSQ18
	r84ntIJagYDBiz9tBrTOES7tAh91VFVBWv6ThON9cKAnCS407hxjchMQKxVD7KRPEuRWncNPeXwlc
	/K8K9owlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGcsQ-0003BC-H3; Mon, 01 Mar 2021 07:21:58 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGcsO-0003Aq-9D
 for ath11k@lists.infradead.org; Mon, 01 Mar 2021 07:21:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614583315; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=B+aKrapw/YSW+hD4qCuW3T2wuadEB8O1yLd9RJsFGUg=;
 b=Cj1qxJXt2eOjYWmaVbNIUu815EL5Z1aicPWt3fHeMMAx4F9YLW6z/ejQGY/gsBrSRidJXSO1
 3yesOb+6hbEW8XzDa6CFg3jfVFZSkiCciqqZmv3O1y47GFprivLvy9UNPw8Y+KLeOIJdOWoi
 rr6NdF6ZbWbObYIV0j8PTptsmik=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 603c960e9e950d0db1dfcc1f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 07:21:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5B8F5C433C6; Mon,  1 Mar 2021 07:21:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D072C433CA;
 Mon,  1 Mar 2021 07:21:48 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 15:21:48 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Justin Mazzola Paluska <jmp@justinmp.com>
Subject: Re: ath11k: qca6390 firmware crashes while connecting to 160 MHz
 channel
In-Reply-To: <ed6c2f2b-3f47-007f-9bdd-135514121aa5@justinmp.com>
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
Message-ID: <af78423479f82ae460541ee3ab737121@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_022156_438974_0DE3C123 
X-CRM114-Status: GOOD (  15.61  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMi0xNCAwMjozNiwgSnVzdGluIE1henpvbGEgUGFsdXNrYSB3cm90ZToKPiBPbiAy
LzEyLzIxIDE6MTYgQU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+IEp1c3RpbiBNYXp6b2xhIFBhbHVz
a2EgPGptcEBqdXN0aW5tcC5jb20+IHdyaXRlczoKPj4gCj4+PiBPbiAyLzExLzIxIDY6MTAgQU0s
IEthbGxlIFZhbG8gd3JvdGU6Cj4+Pj4gKGNoYW5naW5nIHRoZSB0aXRsZSB0byBmaW5kIHRoaXMg
ZWFzaWVyKQo+Pj4+IAo+Pj4+IEp1c3RpbiBNYXp6b2xhIFBhbHVza2EgPGptcEBqdXN0aW5tcC5j
b20+IHdyaXRlczoKPj4+PiAKPj4+Pj4gT24gMTIvMjEvMjAgMTI6MTEgUE0sIEthbGxlIFZhbG8g
d3JvdGU6Cj4+Pj4+Pj4gTXkgcm91dGVyIHN1cHBvcnRzIDE2MCBNSHogY2hhbm5lbHMgaW4gdGhl
IDUgR0h6IGJhbmRzIFsxXS7CoCBJCj4+Pj4+Pj4gc3dpdGNoZWQgdGhlIHJvdXRlciB0byBhZHZl
cnRpc2luZyA4MCBNSHogY2hhbm5lbHMgYW5kIHRoZSBjYXJkIAo+Pj4+Pj4+IGNvdWxkCj4+Pj4+
Pj4gY29ubmVjdC4KPj4+Pj4+IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGRlYnVnZ2luZywgdGhp
cyBzaG91bGQgaGVscCB1cyByZXByb2R1Y2luZyAKPj4+Pj4+IHRoZQo+Pj4+Pj4gcHJvYmxlbS4g
V2hhdCdzIHRoZSBleGFjdCBvcGVud3J0IHZlcnNpb24geW91IGFyZSB1c2luZz8KPj4+Pj4gVGhl
IE9wZW5XUlQgdmVyc2lvbiBpczoKPj4+Pj4gCj4+Pj4+IE9wZW5XcnQgMTkuMDcuNSByMTEyNTct
NTA5MDE1MmFlMyAvIEx1Q0kgb3BlbndydC0xOS4wNyBicmFuY2gKPj4+Pj4gZ2l0LTIwLjM0MS41
NzYyNi01MWY1NWI1Cj4+Pj4+IAo+Pj4+PiAoVGhpcyBpcyB0aGUgbGF0ZXN0IHN0YWJsZSByZWxl
YXNlLikKPj4+PiBUaGFua3MuIEkgZ290IGEgcmVwb3J0IHRoYXQgdGhpcyBtaWdodCBiZSBkdWUg
dG8gY29tbWl0IDM1Nzk5OTQ0NzZiNgo+Pj4+ICgid2lyZWxlc3M6IGZpeCB3cm9uZyAxNjAvODAr
ODAgTUh6IHNldHRpbmciKS4gQ2FuIHlvdSB0cnkgcmV2ZXJ0aW5nIAo+Pj4+IHRoZQo+Pj4+IGNv
bW1pdCBqdXN0IHRvIGNvbmZpcm0gd2UgYXJlIHNlZWluZyB0aGUgc2FtZSBpc3N1ZT8KPj4+IEkg
d2lsbCB0cnkgb3ZlciB0aGUgd2Vla2VuZC7CoCBTaGFsbCBJIHN0aWxsIHVzZSB0aGUKPj4+IGF0
aDExay1xY2E2MzkwLWJyaW5ndXAgYnJhbmNoIG9yIHNvbWV0aGluZyBlbHNlP8KgIChJJ20gc3Rp
bGwgcnVubmluZwo+Pj4gdGhlIGF0aDExay1xY2E2MzkwLWJyaW5ndXAgYnJhbmNoIG9uIG15IGxh
cHRvcCkuCj4+IFllcywgdXNlIHRoZSBzYW1lIGJyYW5jaC4gTGVhc3QgYW1vdW50IG9mIGNoYW5n
ZXMgdGhhdCB3YXkuCj4gCj4gSSByZXZlcnRlZCAzNTc5OTk0NDc2YjYgYW5kIHJlLWVuYWJsZWQg
MTYwIE1IeiBjaGFubmVscyBvbiBteSByb3V0ZXIuwqAKPiBJIHdhcyBhYmxlIHRvIGNvbm5lY3Qg
dG8gbXkgcm91dGVyIHVzaW5nIHRoZSA1IEdIeiBiYW5kIGF0IDgwIE1IeiAoYXMKPiBleHBlY3Rl
ZCkuCj4gCj4gSXQgc2VlbXMgdGhhdCByZXZlcnRpbmcgMzU3OTk5NDQ3NmI2IGZpeGVkIHRoZSBm
aXJtd2FyZSBjcmFzaCB3aXRoIDE2MAo+IE1IeiBjaGFubmVscyEKPiAKPiBJJ2xsIGxlYXZlIG15
IHJvdXRlciBpbiAxNjAgTUh6IG1vZGUgZm9yIGEgd2hpbGUgdG8gc2VlIGlmIHRoZXJlIGFyZQo+
IGFueSBwcm9ibGVtcyB0aGF0IGNyb3AgdXAgb3ZlciB0aW1lLgo+IMKgwqDCoCAtLUp1c3RpbgpE
b2VzIGFueW9uZSB0cnlpbmcgcmV2ZXJ0IHRoaXMgcGF0Y2goMzU3OTk5NDQ3NmI2IHdpcmVsZXNz
OiBmaXggd3JvbmcgCjE2MC84MCs4MCBNSHogc2V0dGluZykgdXBzdHJlYW0/CgotLSAKYXRoMTFr
IG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
