Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB60C4332F
	for <ath11k@archiver.kernel.org>; Thu, 13 Oct 2022 06:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0FJF+4UMIJl3TorHHAMksOAdtUCm02VInFL5tfEF2E=; b=Q9fkpj2Mt+D9UK
	ujleiwHCna3z2gpFhgP+2I2MeNvlATY7Y/cj99OwwaNzLVOygAtz3MQUQoDSNhpHijnO4UQMPPLCX
	E6GDD5C6I0ZLKdr+8Oiy33xwWlikGMi9OFfWbcvFWdR5FMKOnPtUe9rNYQUVSOuLNGsMS9aA5VfNU
	Sh8RAzLdYBT7MYUUgCF8FvvDUc3l+NK9an+lQFQN0wq/M/GQirQDf1Yg8kkrKdrnZWQ2C1rqMTzi0
	4I/6xILXRcF7VlQfyb/KQNf55WaBp/rFRQRMtK6k5xaLVmMk/j6xOSFz8BtaoV1Z4VSNmcK+EYADf
	l/m5HgByHj9NpKCMhsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiriC-00ArB4-Hz; Thu, 13 Oct 2022 06:28:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiri9-00ArAZ-HB
	for ath11k@lists.infradead.org; Thu, 13 Oct 2022 06:28:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 06FB4B81D01;
	Thu, 13 Oct 2022 06:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29B6C433B5;
	Thu, 13 Oct 2022 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665642530;
	bh=NmKHRHCSfjWM56bbjqQSj4SzOeQxq43+XIKSGWzWpik=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SxNZAyuGbeEpVQ7zqmMZzZ/P0RFZVqoUZKwFDU3ha2m1wX7HKp9Q2qzTHP9EsCzZ/
	 Jx0VErrRRRmYtENR3Pe3WH75tpXjzv/ZTOXpz3xjB4fIeYZ+9adx6mYf3NkVE2XTVM
	 Ob/HdmG+mltwjS/G9Q0OrfoG211WleVNYBpk2qIIRaFVM7iNlPomcGuwkJc3QFKEyn
	 aRm7C1qQLMlD3Cnv/1EqZsAy1sJmFrV+Kodf/KXesknBJZODcwvNIo5FQoR4qEiZIj
	 EXMmq0lQa2nUhjIv0WlQSN9oP20Gp86lcrP2aDUtos1+loyYzI7xVbdblT3yAZJUBs
	 tYq3EBTiL+MvA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] wifi: ath11k: modify accessor macros to match index
 size
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1665599807-12908-2-git-send-email-quic_msinada@quicinc.com>
References: <1665599807-12908-2-git-send-email-quic_msinada@quicinc.com>
To: Muna Sinada <quic_msinada@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Muna Sinada <quic_msinada@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166564252533.7747.3943450152611127759.kvalo@kernel.org>
Date: Thu, 13 Oct 2022 06:28:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_232853_891620_EB522EC8 
X-CRM114-Status: UNSURE (   9.10  )
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

Muna Sinada <quic_msinada@quicinc.com> wrote:

> HE PHY is only 11 bytes, therefore it should be using byte indexes
> instead of dword. Change corresponding macros to reflect this.
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>

Fails to build. How did you test this if it doesn't even build? ALL
patches submitted to upstream need to be properly tested before
submission.

drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_set_he_txbf_conf':
drivers/net/wireless/ath/ath11k/mac.c:2711:33: error: 'struct ieee80211_bss_conf' has no member named 'he_su_beamformer'
 2711 |         if (arvif->vif->bss_conf.he_su_beamformer) {
      |                                 ^
drivers/net/wireless/ath/ath11k/mac.c:2713:41: error: 'struct ieee80211_bss_conf' has no member named 'he_mu_beamformer'
 2713 |                 if (arvif->vif->bss_conf.he_mu_beamformer &&
      |                                         ^
drivers/net/wireless/ath/ath11k/mac.c:2722:41: error: 'struct ieee80211_bss_conf' has no member named 'he_full_ul_mumimo'
 2722 |                 if (arvif->vif->bss_conf.he_full_ul_mumimo)
      |                                         ^
drivers/net/wireless/ath/ath11k/mac.c:2725:41: error: 'struct ieee80211_bss_conf' has no member named 'he_su_beamformee'
 2725 |                 if (arvif->vif->bss_conf.he_su_beamformee)
      |                                         ^
make[5]: *** [scripts/Makefile.build:249: drivers/net/wireless/ath/ath11k/mac.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [scripts/Makefile.build:465: drivers/net/wireless/ath/ath11k] Error 2
make[3]: *** [scripts/Makefile.build:465: drivers/net/wireless/ath] Error 2
make[2]: *** [scripts/Makefile.build:465: drivers/net/wireless] Error 2
make[1]: *** [scripts/Makefile.build:465: drivers/net] Error 2
make: *** [Makefile:1853: drivers] Error 2

4 patches set to Changes Requested.

13005351 [1/4] wifi: ath11k: modify accessor macros to match index size
13005352 [2/4] wifi: ath11k: push MU-MIMO params from hostapd to hardware
13005353 [3/4] wifi: ath11k: move HE MCS mapper to a separate function
13005354 [4/4] wifi: ath11k: generate rx and tx mcs maps for supported HE mcs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1665599807-12908-2-git-send-email-quic_msinada@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
