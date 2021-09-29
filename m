Return-Path: <SRS0=zO0o=OT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334B6C433F5
	for <ath11k@archiver.kernel.org>; Wed, 29 Sep 2021 02:42:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC82F6128E
	for <ath11k@archiver.kernel.org>; Wed, 29 Sep 2021 02:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC82F6128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ylo1trFCJTcW0OTIHNdlPfbQWZm7w6XkqtyudrU/TU8=; b=eqgDewQJX3VRp87BtDnP1hUI8j
	3myAAey/+bq2POS/yOEDpOlW0ld1evbVMilltk0Ow6uyKphPjKVG0mIaiuMxjMB1/1Eg+azDEUPne
	BGuBAXJR+h+rM0LlOYh3QS+rfmSCEYcINJT0fZExbSUWzub0ZUE38TmfrbpsLq+sYqRUnhKMtprvR
	mDVnlR/Thvamo8xU2SOoA2IK2y+ewPwwjG+QGg9Dyon1HAHP2enoc9HrgcR0erQfxdNtDHgPBCI6P
	XybPjV9rl6nxe/zE/EcnbD/dWiFDOJ+iuvciqqhX8+SBJL13Y5WlEk3PzJ6eumU2RB60E/c6Ud8ed
	F2oBBdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVPYY-009iV1-V1; Wed, 29 Sep 2021 02:42:50 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVPYW-009iUh-BJ
 for ath11k@lists.infradead.org; Wed, 29 Sep 2021 02:42:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632883368; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YUW1DQ7L4ZgQSKFXRt97oq4J/MqnA0T0yeCiCDSR2PA=;
 b=Y23zaxniwhYq7QrkwyuHXtqQhliFhZm1JCXgqbEevBB0wvrP+enSELd2frtH68A9eDQrlhai
 0e7IWJynbMMfrNuep3njM55Zxi96zkYuRAvhkzOMkR0fCjLF9HG+Ag4mtraOnT02QCRPR/sG
 2uENgMYkOZy9fxBhOOFtyG57+lI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6153d2a53cc3a01f26370a44 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Sep 2021 02:42:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 883E1C4360D; Wed, 29 Sep 2021 02:42:45 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 16783C4338F;
 Wed, 29 Sep 2021 02:42:44 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 29 Sep 2021 10:42:43 +0800
From: bqiang@codeaurora.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/3] ath11k: change return buffer manager for QCA6390
In-Reply-To: <87pmsspwa9.fsf@codeaurora.org>
References: <20210914163726.38604-1-jouni@codeaurora.org>
 <20210914163726.38604-2-jouni@codeaurora.org>
 <87pmsspwa9.fsf@codeaurora.org>
Message-ID: <43fd66ccc28fe80b3ef00e5f1c7e6fbb@codeaurora.org>
X-Sender: bqiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_194248_488982_7373C134 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-09-28 23:14, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Baochen Qiang <bqiang@codeaurora.org>
>> 
>> QCA6390 firmware uses HAL_RX_BUF_RBM_SW1_BM, not 
>> HAL_RX_BUF_RBM_SW3_BM.
>> 
>> Tested-on: QCA6390 hw2.0 PCI 
>> WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>> 
>> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> 
> Same question as in patch 1, does this fix a bug or is just a
> theoretical issue found during code review?

Yes, this patch did fix a bug.
QCA6390 firmware expects some specific packets from WBM2SW1 ring, which, 
however, will
not happen because they are routed directly to host through WBM2SW3 ring 
due to wrong
configuration of RBM.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
