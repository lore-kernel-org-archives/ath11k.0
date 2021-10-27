Return-Path: <SRS0=qRpf=PP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB844C433F5
	for <ath11k@archiver.kernel.org>; Wed, 27 Oct 2021 06:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 898B3610A0
	for <ath11k@archiver.kernel.org>; Wed, 27 Oct 2021 06:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 898B3610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5hDXOr6l85smQwDJdRJB8K2VqMezv3tyrIKz+x3UMM=; b=miW2CZX2pzZolP
	JJQEgubDWmmQvYzkvUOuRbePUdmitgNEnL+Op50p6T9l3I+x6LENPXKoyY4g8ghXzqXg64y8HDood
	2m2gW8h2+nQxZ9tQK9rrKrlY40K0ofS4a37cW44LUrAaiVnBbT0KaAHiPbmjhw6otHNPYMqzlbV4U
	KD3rwHHySiqZ/+ndMc1pceNU84BPbUVwHpL14ws16GjaGX8r/+LnlSkS25en9O6oPHoUqzc15WNW+
	MIPZR/qaskqF8VvLtr4mnYnYMN6zCD178JNt2nXdeMLSnTBhh7jKeeh/56TKXgOsQQce0BRbSvH5y
	6q2Lqo93kWlvc/ta+rsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfcB1-003zSr-5H; Wed, 27 Oct 2021 06:12:43 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfcAy-003zRX-FG
 for ath11k@lists.infradead.org; Wed, 27 Oct 2021 06:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1635315157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLQgxbguMF5yRz6B5r/t+4rHgZszOSE0MY7PRGpztiU=;
 b=VD08oWPbGskSBC5Hbk8ZE1I1vXKcM5kfevoxFhWqAlkiXYSvenlWDJpiVlLTOGDsLpqbgl
 tm+j0n2AYgmC4luQdTaIOoaGLQjwfo6zCWQ3bjJtP3kTiorLgd/wc5VptppNtGDlh7ODxa
 OwrwWfL7lwKPPFom8WqizNf/n4TFsl0=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: Re: [PATCH] ath11k: clear the keys properly when DISABLE_KEY
Date: Wed, 27 Oct 2021 08:12:35 +0200
Message-ID: <26869605.A2Tbvc0WiF@ripper>
In-Reply-To: <20211026155446.457935-1-sven@narfation.org>
References: <20211026155446.457935-1-sven@narfation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_231240_692216_E8C436B8 
X-CRM114-Status: UNSURE (   4.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tuesday, 26 October 2021 17:54:46 CEST Sven Eckelmann wrote:
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

I would like to retract this Tested-on. My test caused another problem which 
resulted in a complete shutdown of the vdev. After fixing this problem, it 
turned out that this change didn't fix anything (as far as I can see) on this 
firmware version.

Kind regards,
	Sven



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
