Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678BBC636CD
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rFzeMoMDrMu8JyjNVc3IaqnFGBPQ5eLkIQF4uKVNMs0=; b=oTc
	szG6aeufTr1bSXRN+sa1OQa4G8BQ8PI2SlgBWQMOwcGZl52djpGo92m1YuG2AmXUrzWaFHO2wT1bP
	Rzqp9viGCBVXayX/yjJcgyT4tQFnQ+6rFhT1kZ+AbKbLJCX9DfTunjCfizypeQdK0XCwO5HjZrC9p
	DcOE3raQXfm4Ahc3B3xo+0Nvr5LmqWK0tpvYEnjHOUeU9oKbBMHNxecLNCrlnrOGefNfR917NbYH+
	1d9ntxX28vSKFyIrtdo3UARPviVV4EpsAn4C16N5ALE+LirQBqgwAxSKr85hzP6+BZHkX7rb4/Ewc
	CNkEo9sMMB7hMhYTX9C5m5I1/3yUnsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOKC-00CLwZ-BK; Tue, 07 Feb 2023 13:47:56 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOK9-00CLvu-5E
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 13:47:54 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-52770ee8cf0so119879397b3.2
        for <ath11k@lists.infradead.org>; Tue, 07 Feb 2023 05:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h3feSrdNX7UsAr/gHLzI9hOOhzUVdb88aNZ2wt4j9Nk=;
        b=WCdkBV5pcH62VnUYarTyTQieLpPEDlEkrQKVQ0fGN1n0SRADaRpccFO/KUt1aATZ/o
         TWexSWEoaHcxHmEhfwTeRwVjZk+Yotd1fKoe3dnxmw+wXp2N88QnbtzgXbj7eS2kqP+6
         fWPK1NmhNgpoD9fwRy/ZNezBio9Hso1wFt3u0w3IRLA/81myBHLdtOsExh/v/hnSrc2n
         cm+yprHcScJiJzfvKrl+ylDmSVxpWsnMgzBw/7GPqEHZVCh+/k8hml1J3c4EuHITFCo7
         Mg4fqFWcu/H1Un59oFObC+Fr1/roooXoZYtF9ctT9hIyrlqY3sAZ4oetVM9AbXkcsBnL
         tEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3feSrdNX7UsAr/gHLzI9hOOhzUVdb88aNZ2wt4j9Nk=;
        b=WAyoSek9F/CF32lGykCNAYJq11eXpYKZV6rxpNej5c4kfcvyrIVSP8Y4KfOpulgdl/
         ujanLF/lJiIYZUMpzP26xtwYGff7K1QXkAsIkH0Eiih0u0GTmCASTF/7bGGQbXEkqVrK
         0uerEGRQzvnVdrtzJC+utAXIbpSqfuJ+IVzhBfOnsUcGnHaitmLPPEoJHH02E9q5nwwd
         tBnwKSM9BGbHk6sxn5OpcRbluMvxVMvba5e5mo0iCQCmTrOJ3S6aHhbNXjDQP8vd7gI5
         ghYq2Cz+Yoa798OUpHxYoA+pbCnIR3ez+SB5+rq354n2YhHT48dTxFI39tJWIvwC+fRj
         NeyQ==
X-Gm-Message-State: AO0yUKXM8gb4UeBQhuxrK8wpDnP5Rq3xAmDb/KLUtpyOHHl50/6zIDQ5
	LfFtSE8xfVhfMv2o/33S3BVN3RPCFMWx7XpphVUGL139L3A=
X-Google-Smtp-Source: AK7set/m4kooNMocaZHWONeg0Hg36Unp5/vURsyBJxbAEeTA/hZghd0jq3kp7kUVLm/zPxbUSpv4yYNnWiQzeAJ5V6c=
X-Received: by 2002:a81:de46:0:b0:527:83f5:3f08 with SMTP id
 o6-20020a81de46000000b0052783f53f08mr273704ywl.425.1675777672202; Tue, 07 Feb
 2023 05:47:52 -0800 (PST)
MIME-Version: 1.0
From: Carsten Hatger <xmb8dsv4@gmail.com>
Date: Tue, 7 Feb 2023 14:47:39 +0100
Message-ID: <CACp=KFTTOpKzDkMuGyYm3ynF53nqHLwdAqt79mMJLpCyTyy-Zw@mail.gmail.com>
Subject: FIX: Frequent wakeups on HP Pro x360 435 13.3 inch G9 using Qualcomm
 FastConnect 6900
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_054753_216091_0B31FE1F 
X-CRM114-Status: UNSURE (   3.45  )
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

To whom it may concern:

I was experiencing frequent wake-ups from s0i3x on a HP Pro 435 G9
convertible [1] using the Qualcomm FastConnect 6900 SoC [2]. The issue
is related to FW revision
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9 that comes
bundled with Ubuntu 22.10. It appears the SoC increasingly triggers
wake-ups after being suspended for approx. 4 hrs.

Read the full story at [4].

The solution is to upgrade SoC firmware to rev
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23/ [3]

Best regards,
Carsten

[1] https://support.hp.com/us-en/product/hp-pro-x360-435-13.3-inch-g9-notebook-pc/2101144107/document/ish_6053745-6053789-16
[2] https://www.qualcomm.com/products/technology/wi-fi/fastconnect/fastconnect-6900
[3] https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0/1.1/WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
[4] https://gitlab.freedesktop.org/drm/amd/-/issues/2377

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
