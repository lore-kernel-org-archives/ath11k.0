Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14096C77B70
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfbreRqfM/2RvBd0DsVZcOEboikiw8v4XJLFCxsCEdo=; b=nBZILtuT6vd8ES
	zvskfBsuOG1eGBA0yxGs6jnQA6cahHnaKsoVLmKnaWpB+TBBeQab1q/vWQ9+S/dAEuAp5f6D+/eAa
	Q9Ne6U/KhP0CftPwHSkt1byQEj4efz8jJfcCahgaBmT4Y1H/5iUI2ClWu7qrCI6p76QW/f0JMs6U7
	8a3WUwRcVNDsCQJLvp2EsmD9rWLC52RmIi9TN1K53bcPIfGpXC7AbspOY50gq+iEBRDpGLwdeQX63
	4m5yfOKcn56FgvybaoggHczJIOKdIeJ06aMcmL4C2ZaDihROEtGqLpyBxGZjQdWJyNYYehsjZ2HKW
	o64Rzbs6Xd37bHVzg8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLtu-00FhdU-1U;
	Mon, 17 Apr 2023 10:15:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLtr-00Fhcw-2B
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 10:15:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E414F61275;
	Mon, 17 Apr 2023 10:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093FBC433D2;
	Mon, 17 Apr 2023 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681726554;
	bh=BoWLgyjpa03Gf/MUIqi36FWdFoNOD1x6WzPGN7MDxsk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=r0Pb/F5e24dWHomrRigt8nuU00IEuThB2GcW3ofoekj9tm3UP1PrM8g7vcia0LOYy
	 ZN7k9UrpisRMzA79wWzLvOdphMEP5id1lo/rXUebcqSxF6IBi/MhkrME17TcxXTJvy
	 UnIWX82MhVGwaslcp58mFcCHia3HNUG9SS0IGkzc+XGMrR2M9T+Y64RZhCNj2Lfi1P
	 3y3/ePQ28m6JSowDYtFSuj5Gghy7MI1LCywhfjQatN9RmYaGvZVnW7z/bPwauNXGE8
	 NXQQUNpoNRwTSztJW4beK6sagxsm6/A+UtxSRc+GElepmJDgtupsW2XCFXCz/HYRDf
	 rF+2fl+9dsVZg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Add SAR support on WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230328113455.11252-1-quic_youghand@quicinc.com>
References: <20230328113455.11252-1-quic_youghand@quicinc.com>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <--cc=linux-kernel@vger.kernel.org>, <quic_mpubbise@quicinc.com>,
 Youghandhar Chintala <quic_youghand@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168172654895.12889.1342006760262786492.kvalo@kernel.org>
Date: Mon, 17 Apr 2023 10:15:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_031555_751215_B5FBE758 
X-CRM114-Status: UNSURE (   6.75  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> wrote:

> Currently, SAR is enabled only on WCN6855, enable this for WCN6750 too. This
> functionality gets triggered, when the user space application calls
> NL80211_CMD_SET_SAR_SPECS.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

abf57d84973c wifi: ath11k: enable SAR support on WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230328113455.11252-1-quic_youghand@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
