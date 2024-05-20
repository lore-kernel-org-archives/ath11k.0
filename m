Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D711C04FFE
	for <ath11k@archiver.kernel.org>; Mon, 20 May 2024 04:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYW5nPiWMNSPOB06uS3rc1WPwBpNnN2j0nMmjIJlVBU=; b=jlAX8+D+laOcVVpdEX6R0IFH2w
	8IkFO5tO/LWOTWT9MwaRBXITz9J9FcRkjzjmXSlAI7f2s6NRgloU7iO1fErLxyXTWXx18FGFl331B
	6zfPUfl/g9+avqpbcEl17Q+tqRek5IstrHYOzp/3qImRi/VAKWj8dT7GHtv5HReQ6PY7oRt190SW+
	JbjOk8aHDEizRCo0UNK7cxiDiGwhUmvqxudTyeuP/fw/fafzF4bZOAbkZBT99aJCWyzI7/Zu+Zrat
	j1b3eRCHNcvw6S1xXUKfQ6jZPNtutdj33ps+OYIHNwuN/hhTCq/OSgY7/jII2mkfASSkW3Al5ldAo
	1XUillng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8v5P-0000000DWWt-2Hfa;
	Mon, 20 May 2024 04:57:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8v5J-0000000DWVg-3Q2e
	for ath11k@lists.infradead.org;
	Mon, 20 May 2024 04:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1F506131F;
	Mon, 20 May 2024 04:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE470C2BD10;
	Mon, 20 May 2024 04:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716181028;
	bh=QMkoV1HCgGjWuiwba/dY7eyC1+I7pq8rO6I224Vc+2Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kqgx06eg8ovepo5EOJmZNq13iLlGxTNawK1yCgXOJUPXOY6xfZoZ8OPawlMB/xV3Q
	 p0pLIzi0qwB5HGUAjaDusfCdQo1OA2aIkR0P5Hcf4LJwHBphBdMmfq1C+cA6FDQbD8
	 WD1QT5ujPLIlk8QgZ0AFr71dQiB4PjJes4Mn8znsSUan6Vqrjc2t0VT2kHSLoBhpTq
	 nDyLsbUAXYK+3UUX1Al7iPBeEJ1UOlpQD+ArX5zH/fXvRi5lOHYyeWPAckunQhANyc
	 a8IeWwKmPeiEAYREQnkSb2wTzUqt1SvHMvA2YuxvlP4/qSNqfPUG8wlD3b2KGtWJ2+
	 C0pBxRB/VrUaw==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix WCN6750 firmware crash caused by 17
 num_vdevs
References: <20240520030757.2209395-1-quic_cjhuang@quicinc.com>
Date: Mon, 20 May 2024 07:57:05 +0300
In-Reply-To: <20240520030757.2209395-1-quic_cjhuang@quicinc.com> (Carl Huang's
	message of "Mon, 20 May 2024 11:07:57 +0800")
Message-ID: <87wmnpdqse.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_215717_922646_1D2D006F 
X-CRM114-Status: UNSURE (   9.36  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Carl Huang <quic_cjhuang@quicinc.com> writes:

> WCN6750 firmware crashes because of num_vdevs changed from 4 to 17
> in ath11k_init_wmi_config_qca6390() as the ab->hw_params.num_vdevs
> is 17. This is caused by commit f019f4dff2e4("wifi: ath11k: support
> 2 station interfaces") which assigns ab->hw_params.num_vdevs directly
> to config->num_vdevs in ath11k_init_wmi_config_qca6390(), therefore
> WCN6750 firmware crashes as it can't support such a big num_vdevs.
>
> Fix it by assign 3 to num_vdevs in hw_params for WCN6750 as 3 is
> sufficient too.
>
> Fixes: f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces")
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Closes: https://lore.kernel.org/r/D15TIIDIIESY.D1EKKJLZINMA@fairphone.com/
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1
>
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>

Luca, can you test this as well just to be sure? The patch is here:

https://patchwork.kernel.org/project/linux-wireless/patch/20240520030757.2209395-1-quic_cjhuang@quicinc.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

