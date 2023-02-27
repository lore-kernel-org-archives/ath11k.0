Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548A8C64ED8
	for <ath11k@archiver.kernel.org>; Mon, 27 Feb 2023 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FA+gKef0Lma2m1qknay1BNa5/nqVmRWDLETzKi19R8g=; b=EssETq71jYvoJz
	c/hKin+FTd2yxR+DBZgitZuxTAv2UH9dMawa5ddwbT5kJn885ogoatyQLdE7DyjNoCT+n9tX8d+0f
	jSbCqboiZPVA3wJ7cMRY0lZXS+xbgM6CEUzt2e1CC0U2/8wZgTmdDiLyHg7RCHxV/0WysPRtHsuVG
	OlcEuur9gbI0Y4fHFlEIWhc7D3EhyZnsphNWiCun9/6BjgTleyOlNle13qtHH/AQhqr893AEqHrtV
	NNv6SWasKngD9UQUxkLQED6LTZXtFdmdY6Pj/BotUZVvI1/Ff9OqOBruJ4/CRTlLBwbjRRAVC0aDU
	0czirim48MhU8I0SYxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWcaP-009anY-8J; Mon, 27 Feb 2023 12:26:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWcaM-009anE-SX
	for ath11k@lists.infradead.org; Mon, 27 Feb 2023 12:26:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 949B2B80D21;
	Mon, 27 Feb 2023 12:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E76C433D2;
	Mon, 27 Feb 2023 12:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677500787;
	bh=NWYcefWMGiJtQtWkVlsBbS8T38GxvFGeYVBhy11A6jo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kT/hGlUWVeyDb80mqmh97ccuUY8AuVsE6F166ITxuM8f6j6GZONG9Z9nO6OKgaaOD
	 VF+pNlq7dqYKomIgImhp7vXMgle403G86W21uj07JlsFBLTyMVnsFbPtnXq4FqDN3G
	 eI+VDYh1gG3FT+H8ko2N/EnPTqZ0hBm2e53XBxlToGOQ+b9K2/rDQ7RxZDHEWFszQ5
	 cjvnvTxgE7NW1sistxT+c7aM/Wlwqfs7SGnLNsX8Xp4XyDDezNHgXeeqATjteECg7U
	 an9EjfeYbqiRDb5ef/Xa2uKep3ncdb3t64NeK5+0X2Mc+Wz3BnBvueFWYEc5Q8LJTB
	 UfN1WNxqGJr6w==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] wifi: ath11k: modify accessor macros to match
 index
 size
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1666128501-12364-2-git-send-email-quic_msinada@quicinc.com>
References: <1666128501-12364-2-git-send-email-quic_msinada@quicinc.com>
To: Muna Sinada <quic_msinada@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Muna Sinada <quic_msinada@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167750078195.17465.18276986078298720145.kvalo@kernel.org>
Date: Mon, 27 Feb 2023 12:26:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_042631_109850_957FBACC 
X-CRM114-Status: UNSURE (   7.50  )
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
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

a96f10422e74 wifi: ath11k: modify accessor macros to match index size
38dfe775d0ab wifi: ath11k: push MU-MIMO params from hostapd to hardware
8077c1bbbc28 wifi: ath11k: move HE MCS mapper to a separate function
ebf82988f844 wifi: ath11k: generate rx and tx mcs maps for supported HE mcs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1666128501-12364-2-git-send-email-quic_msinada@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
