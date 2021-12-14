Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D140DC433F5
	for <ath11k@archiver.kernel.org>; Tue, 14 Dec 2021 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAF1pkiIdK1af4FNzYoyN4dBkfbCIHvvRcRK+djTwiQ=; b=yT/U5+yht+aeEq
	pM16oRvL9Ab0zKlL5pScc6+t7tadvm1LfEW2m/MrWq6JNy7128hLt3BVVo+8QCD2frbDuWn1/zZx7
	zeybVhPWyFS+IxcnGRFShQiBTd1EgnC8I9ZC+GXUibNJDCNwQdE/NIhpvIZUdQ4sjxlSqtSn9f3wo
	tQEDrdMWRe0QyUNyhxE/weaUPYFMUFiaT5alCxEMTlk5u6iWjx5pBTaHskVSb4MUog0GNGO3ma3IN
	QPhK+OQ9mnN7RcWwYDjPUUXTQ4hxxBeh2udqTD0P48QeGAYs5ure08R4mX8ha/MA6rma+hrQjjgQO
	VwnJ2SVBEz6kAqod10cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx9nT-00EhKp-UF; Tue, 14 Dec 2021 15:32:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx9nR-00EhJV-Jk
 for ath11k@lists.infradead.org; Tue, 14 Dec 2021 15:32:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2BC6FCE18EA
 for <ath11k@lists.infradead.org>; Tue, 14 Dec 2021 15:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D62DC34601;
 Tue, 14 Dec 2021 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639495968;
 bh=rNQOyKP91WXUWPlQpTUVmCNNBaTB58gSLYUa6dOW958=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=s2cMsEd2G4PvMLhNSdPeCRLjaCETeFxMk5+TnFFYzIImvKBUEQpy7WQEKcmjOK82r
 AM2l9iRyJtyp1XMBQznDkJdOCOUIez1Blxa714NYBlORln/O7xHf+SWsMg8oQwu4rY
 7JXlJMKP/uMkDXQgBHNT2oVONCeKm2NyLr3Yr6PWlW+lfV6IP2pV56S9Si5VXuCNny
 ZVmDHJu5LILz8n9/zV9XsN2QwAwVv6GgUugaLs6NbAsq216M34aMkTL6AkkYnvsRg3
 l7TTVuQB12GctC97Udi+j9LOHuHYhbi074tu8NjXLG/iR2diN+It/ZtZbAyYaAFHZ9
 x0XMwB4kc04QA==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] ath11k: add ab to TARGET_NUM_VDEVS & co
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211209104351.9811-2-kvalo@kernel.org>
References: <20211209104351.9811-2-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163949596601.10444.7465143029436513701.kvalo@kernel.org>
Date: Tue, 14 Dec 2021 15:32:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_073253_876476_35C5FB8B 
X-CRM114-Status: UNSURE (   7.88  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> The next patch changes TARGET_NUM_VDEVS to be dynamic and need access to ab.
> Add ab separately to keep the next patch simple.
> 
> Compile tested only.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

523aafd0f071 ath11k: add ab to TARGET_NUM_VDEVS & co
beefee71336b ath11k: Change qcn9074 fw to operate in mode-2

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211209104351.9811-2-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
