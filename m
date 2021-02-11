Return-Path: <SRS0=Y6aC=HN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F01C433DB
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 11:11:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CD664D73
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 11:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04CD664D73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qJ5VTEeLCrNsi9NNPUkfcNFSEzAjVh2Z5qLRgdFI6hg=; b=jjGZPltPMgYZdv9FIhK+sl+UB
	B+palZJjjNlp7ndqFl15FjLJMQQijidLx5YnMPzar1xRuSBj9g7WfrC57dA2Ixoff9UdbeI1Uh92y
	ZJhTANRMAgkpQA6dAyQ5YC2qqNIRwTI7M7ybcZpk8IjAX5Wv6xkWw0Vi//AgH593C3fQezEX6EIuB
	B6pQpjek4d6CeMaKKEmXSRaU1S7yhZ+24IwElbkv3wg4BDkWn1qNnjvzeiCNTZwBsEmpSoLFQNvYM
	KsH1r0L5KZ0RQPBq3i85Q7ec68TRTpzbxIYA+rslszoUQl5EdkXmAvdjG4G4dOvwXGinxgSw0cN/v
	oPO4PWPsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA9sI-0004ia-Kw; Thu, 11 Feb 2021 11:11:06 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA9sF-0004hY-HH
 for ath11k@lists.infradead.org; Thu, 11 Feb 2021 11:11:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613041864; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=QKKVxtyUU7172KTV6lvC+MwPSjOqkLqCsP+RH8gTldU=;
 b=jyXVBtcw+4ug38QeEwHZrA4pJfxDkqm0/IQ0s9JKMoEV/gkanFLSUWIv1BohJehFtyrZGmWm
 je6Rux97FvB+2fiRUUT9O5yCuPwYtcwYIc8tZkMre/lcJJihlwWxJ2/AeWK2o/dx0jfSUyXC
 PMx7yzolfEm4V/qGonefzn4qq/g=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 602510aff112b7872c797b6b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 11:10:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8F44AC433ED; Thu, 11 Feb 2021 11:10:39 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 54A23C433CA;
 Thu, 11 Feb 2021 11:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54A23C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Justin Mazzola Paluska <jmp@justinmp.com>
Subject: ath11k: qca6390 firmware crashes while connecting to 160 MHz channel
References: <87blew3e4q.fsf@codeaurora.org> <87blew3e4q.fsf@codeaurora.org>
 <054ddea6-639e-c21e-d404-d551c65128df@justinmp.com>
 <920c8cc9-21fb-b7aa-4b49-be7656fb14b5@justinmp.com>
 <f776233a-0ed6-1ebc-3d68-be4a88514736@justinmp.com>
 <874kkfozhp.fsf@codeaurora.org>
 <a170a87b-072d-dc8e-6833-231e0df5b23c@justinmp.com>
Date: Thu, 11 Feb 2021 13:10:36 +0200
In-Reply-To: <a170a87b-072d-dc8e-6833-231e0df5b23c@justinmp.com> (Justin
 Mazzola Paluska's message of "Mon, 21 Dec 2020 14:25:52 -0500")
Message-ID: <875z2yuafn.fsf_-_@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_061104_251890_8EF9ED6B 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

KGNoYW5naW5nIHRoZSB0aXRsZSB0byBmaW5kIHRoaXMgZWFzaWVyKQoKSnVzdGluIE1henpvbGEg
UGFsdXNrYSA8am1wQGp1c3Rpbm1wLmNvbT4gd3JpdGVzOgoKPiBPbiAxMi8yMS8yMCAxMjoxMSBQ
TSwgS2FsbGUgVmFsbyB3cm90ZToKPj4+IE15IHJvdXRlciBzdXBwb3J0cyAxNjAgTUh6IGNoYW5u
ZWxzIGluIHRoZSA1IEdIeiBiYW5kcyBbMV0uwqAgSQo+Pj4gc3dpdGNoZWQgdGhlIHJvdXRlciB0
byBhZHZlcnRpc2luZyA4MCBNSHogY2hhbm5lbHMgYW5kIHRoZSBjYXJkIGNvdWxkCj4+PiBjb25u
ZWN0Lgo+PiBUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBkZWJ1Z2dpbmcsIHRoaXMgc2hvdWxkIGhl
bHAgdXMgcmVwcm9kdWNpbmcgdGhlCj4+IHByb2JsZW0uIFdoYXQncyB0aGUgZXhhY3Qgb3Blbndy
dCB2ZXJzaW9uIHlvdSBhcmUgdXNpbmc/Cj4KPiBUaGUgT3BlbldSVCB2ZXJzaW9uIGlzOgo+Cj4g
T3BlbldydCAxOS4wNy41IHIxMTI1Ny01MDkwMTUyYWUzIC8gTHVDSSBvcGVud3J0LTE5LjA3IGJy
YW5jaAo+IGdpdC0yMC4zNDEuNTc2MjYtNTFmNTViNQo+Cj4gKFRoaXMgaXMgdGhlIGxhdGVzdCBz
dGFibGUgcmVsZWFzZS4pCgpUaGFua3MuIEkgZ290IGEgcmVwb3J0IHRoYXQgdGhpcyBtaWdodCBi
ZSBkdWUgdG8gY29tbWl0IDM1Nzk5OTQ0NzZiNgooIndpcmVsZXNzOiBmaXggd3JvbmcgMTYwLzgw
KzgwIE1IeiBzZXR0aW5nIikuIENhbiB5b3UgdHJ5IHJldmVydGluZyB0aGUKY29tbWl0IGp1c3Qg
dG8gY29uZmlybSB3ZSBhcmUgc2VlaW5nIHRoZSBzYW1lIGlzc3VlPwoKLS0gCmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93
aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1p
dHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEx
awo=
