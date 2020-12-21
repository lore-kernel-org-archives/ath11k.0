Return-Path: <SRS0=/m/M=FZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D405EC433E0
	for <ath11k@archiver.kernel.org>; Mon, 21 Dec 2020 17:11:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691BC22BF3
	for <ath11k@archiver.kernel.org>; Mon, 21 Dec 2020 17:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 691BC22BF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I3vGvg5E2Jh97aXRJLXgv0bVfpeJrwia9NS/ZKE/owQ=; b=zqUySVXbw1QDoDSF0VhPyvQVp
	Ws5FB1UQK6wNcmkCJFjKJ3HrszxzQTPHcT6n7yPIu8daNvHKZSSsgZXAJPPSZxwahahMH+ZoJgLh/
	3VNFOz1YMehgcPI9HG5A8OYp68VuaaB9P+QipRCTfCVBz/aRoMjOiUbcK2Q5ChawVCWcM/f/TdtfM
	owOdOnPbjV4wJdcDZgwOxsnJyuWmKBNG5YK5ekHxBrWABAOgupV/F/ZRbi9NyKyQDiF4uvt6VKf7F
	6Pk2VhYT+Qpf9HPm1sqlPm+8bWSqRv7AGTZ4tLx74zfp2f1BDRaPLhMoVz3gEO3DJhvNDDCOrEeIl
	kLJUEbfBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krOiw-0006Yx-Vz; Mon, 21 Dec 2020 17:11:55 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krOit-0006YK-LR
 for ath11k@lists.infradead.org; Mon, 21 Dec 2020 17:11:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608570710; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=Hpes+A4q6XJKrC9g+uJ8qh7Zqa8c9m/+RZL5p5SHQVQ=;
 b=eI9wpLGcol/VsE59gfgo+EP9qTb1S4FJt73o6lXXdx1im7aacB+hgyBix6Wd6wg9/7GysTTp
 tVSrmjud0LdM10Kjy3p6dF2H9luYxLR2PaWpJZCIFgS0fSq8PaeS3yWvz8RInbbjGf7OObuJ
 jqhxxo1tmmFqxz7XTTn9oNqEwe8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fe0d755da47198188fb8b08 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 17:11:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1E348C433CA; Mon, 21 Dec 2020 17:11:49 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EBB44C433CA;
 Mon, 21 Dec 2020 17:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EBB44C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Justin Mazzola Paluska <jmp@justinmp.com>
Subject: Re: ath11k-qca6390-bringup-202012140938: rebate to v5.10 and MHI M2
 workaround
References: <87blew3e4q.fsf@codeaurora.org> <87blew3e4q.fsf@codeaurora.org>
 <054ddea6-639e-c21e-d404-d551c65128df@justinmp.com>
 <920c8cc9-21fb-b7aa-4b49-be7656fb14b5@justinmp.com>
 <f776233a-0ed6-1ebc-3d68-be4a88514736@justinmp.com>
Date: Mon, 21 Dec 2020 19:11:46 +0200
In-Reply-To: <f776233a-0ed6-1ebc-3d68-be4a88514736@justinmp.com> (Justin
 Mazzola Paluska's message of "Sat, 19 Dec 2020 16:46:50 -0500")
Message-ID: <874kkfozhp.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_121151_739100_EF5F3D95 
X-CRM114-Status: GOOD (  11.19  )
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

SnVzdGluIE1henpvbGEgUGFsdXNrYSA8am1wQGp1c3Rpbm1wLmNvbT4gd3JpdGVzOgoKPiBTb21l
IG1vcmUgY29uZmlndXJhdGlvbiBoYWNraW5nIGxlYWQgdG8gc3VjY2VzcyBhdCA1IEdIeiEKPgo+
IE15IHJvdXRlciBzdXBwb3J0cyAxNjAgTUh6IGNoYW5uZWxzIGluIHRoZSA1IEdIeiBiYW5kcyBb
MV0uwqAgSQo+IHN3aXRjaGVkIHRoZSByb3V0ZXIgdG8gYWR2ZXJ0aXNpbmcgODAgTUh6IGNoYW5u
ZWxzIGFuZCB0aGUgY2FyZCBjb3VsZAo+IGNvbm5lY3QuCgpUaGFua3MgZm9yIHRoZSBkZXRhaWxl
ZCBkZWJ1Z2dpbmcsIHRoaXMgc2hvdWxkIGhlbHAgdXMgcmVwcm9kdWNpbmcgdGhlCnByb2JsZW0u
IFdoYXQncyB0aGUgZXhhY3Qgb3BlbndydCB2ZXJzaW9uIHlvdSBhcmUgdXNpbmc/CgotLSAKaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpo
dHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRp
b24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
