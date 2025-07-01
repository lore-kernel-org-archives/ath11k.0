Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE75C8302F
	for <ath11k@archiver.kernel.org>; Tue,  1 Jul 2025 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3M38GSuXs/gOih2Qd2aEJMemXuoVdd0+cL20a4ZnlA=; b=CxG+xus97EmlwQl6uNwwiOhXws
	kP403d/BZZW3EgIhQdzl7nlbUyopsqvqGlmz/9na0CZdpAGraqdkRfDwGJ6Ou1OmgwGkL4tu6b5qH
	NvbhpFHJL8si+R0EGo4I65ihhiQiXlpOaWEbnWUFrAbXNVlAE2sStV+DP63WsTLKpAZsCGnNFb16n
	tNXEJ6bkrNO5CfQ1bg3WaaxhN8qwBBkmaW/+8k8IUofOZQgLybisBL5+oJvCDggb68rH+15KtFcjP
	VePYsl/l7aqzfHETrLK3Y6MHMImbl6P4i89Bv7eNp1vDIhdWszN+/27a+fvlT/QoHZAc4xtru8bb4
	CvCUKDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYE8-00000004ki6-1AqX;
	Tue, 01 Jul 2025 10:28:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYBl-00000004kMA-2Lv2
	for ath11k@lists.infradead.org;
	Tue, 01 Jul 2025 10:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2CD461127;
	Tue,  1 Jul 2025 10:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E625C4CEEB;
	Tue,  1 Jul 2025 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751365568;
	bh=EWqF4PS4ux3AR3WZyTBG58Z+5XJMCAN0LTz5K9oLotk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvBn6uJhNChAJjETNk3DJAnFYB7SCcZquwZZWaRxzGYX9ReESOQ54xSrIhO3TOyDB
	 Xb/H+XjBCzjnbO2RJXvwP4EOY8fm2/iRV3ts1iOim1P4uLZvehOPQaRZ3kFMpiFYZM
	 gQQyhjtmV+uUhZqAlDIwpCK5Eppxnr8Lsm2u7dSs=
Date: Tue, 1 Jul 2025 12:26:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	Sujeev Dias <sdias@codeaurora.org>,
	Julia Lawall <julia.lawall@lip6.fr>,
	John Crispin <john@phrozen.org>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 3/3] bus: mhi: keep device context through suspend cycles
Message-ID: <2025070144-lent-buzz-28ff@gregkh>
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-4-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630074330.253867-4-usama.anjum@collabora.com>
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

On Mon, Jun 30, 2025 at 12:43:30PM +0500, Muhammad Usama Anjum wrote:
> Don't deinitialize the device context while going into suspend or
> hibernation cycles. Otherwise the resume may fail if at resume time, the
> memory pressure is high and no dma memory is available.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")

No cc: stable?

