Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F69C4332F
	for <ath11k@archiver.kernel.org>; Thu, 22 Dec 2022 14:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5QprzcC0vcTfXW+7pCASFZYVcpiLZSjul4Pzif2Z+w=; b=gH3YWsw5HXWSo9
	PWM9otWopvBUDZfZ/Xu8ICoH8WOQJ+Mzh/p3EDUld2vmMipoTApBb0EvT4iGUAzcgngPCBfoGdvX9
	F5idGDgzjx253wq/lknTxbhSELVhDLoXI41Za+jBapp+o4UGXUCUiGLWZWd84ujSTQmZhkgjo1KHW
	eAfxvXoVUKo8FNt40GLs27b4B//r9Brtuu9Xt2tGbSN+6gh9rTBTskmjQrp1upe1bmzWLO8Of1h1G
	ifmFe9+to31m1kx0AihJZ70uNel1QgVyj+hisR80jU0bDLsZavXUu0WL12JtJZM6JcRRPT2qDD2R0
	1690hxXrAUOR6kN8Tkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8M9X-00Cizv-Tm; Thu, 22 Dec 2022 14:02:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Lmu-00CUwl-TO; Thu, 22 Dec 2022 13:39:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FCDD61B48;
	Thu, 22 Dec 2022 13:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDDAC433F0;
	Thu, 22 Dec 2022 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671716346;
	bh=yS7HKNuyi7mY2vch1fKOPIjO+678P8Ts9QJUAtVHVBE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YCZzIJDK/CbHqh5WsE5tCSYjVyfSElNxBjqOHJzJo5obHknTKNaQgMmInFe5pHiO+
	 ChholLIBSfN/Lcu7esTRH2qcqAm9h4/GUhNjo7rlntIQZ4WDxbqGN3M0jbXwIoX1/R
	 HMU2rfifrs+kISxPGE+F5GbuGDYvabnQrbt8rZiP2MHU8WQxCcHFRHJmIV9ARK72AE
	 W0igAHGegXVeh2lWb0t/lds4Cd/mIt0iak57ECyghrNe6dte5DpxMlV6dMlY+V/cSq
	 qJX81nDMLDBFJ7jquAQ9H2p/Xl9fv+mL63xgBoEC1Ba7/5+lEhCQYg52KR5nmQliOm
	 76TafiCWRM5vA==
From: Kalle Valo <kvalo@kernel.org>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <johannes@sipsolutions.net>,  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  <quic_mpubbise@quicinc.com>,
    ath10k@lists.infradead.org
Subject: Re: [PATCH 2/2] wifi: ath10k: update the channel list if change in channel flags.
References: <20221222120529.31436-1-quic_youghand@quicinc.com>
	<20221222120529.31436-3-quic_youghand@quicinc.com>
Date: Thu, 22 Dec 2022 15:38:59 +0200
In-Reply-To: <20221222120529.31436-3-quic_youghand@quicinc.com> (Youghandhar
	Chintala's message of "Thu, 22 Dec 2022 17:35:29 +0530")
Message-ID: <87sfh7zhfw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_053909_144286_7C3B7830 
X-CRM114-Status: GOOD (  14.92  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> writes:

> There are connection failures in hidden SSID case when the device is
> with default reg domain WW.
> For WW reg domain most of the 5 GHz channels are passive. When device
> listens to the beacon on that channel, the driver is updating its
> channel flag but firmware is not aware of it and firmware is not
> sending probes on that channels.
> Due to this, we are seeing connection failures when a device is trying
> to connect with hidden SSID AP.
> Register beacon hint notifier to the regulatory core so that driver get
> notified when there is a change in channel flags. Driver's notifier
> callback will send the updated flags to the firmware.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00174
>
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 11 +++++++++++

Please send ath10k patches to the ath10k list. I added that list now,
but no need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
