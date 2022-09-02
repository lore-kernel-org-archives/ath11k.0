Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B601AC38145
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7O+f0fIM2got013heSNXHgRaxEyMfVMsonx0nj+4iFo=; b=AtO4k6bt3hSnmE
	a3aZFLrm60+VNKFjluoV6fGKHlFPcKvAo5EEOLhsaENhu8TYdXGAlaKv/jhYIl/3B0yd6k4wxrvUW
	SP95KCki5tLJxYmGUBJ0naEmRXLgdaU6rD5R72hwIzWnRGhS8eWr4jVvdp/zEdwnnIWzN1xXmuMcb
	0o9VINsuCpYQPN/cq6gVvbBJTI3cZYfczeJLpiNxg0ADAdx5wB0TyL8NhElQIwkjwaWcXAe9NODZp
	AMueO4v+cGF/BUSv94UTqxU6pHbv/90Wg7VWVEha84Bf187h8g6IsP5w69F9s4h+PCzuuDrtfClyK
	sMMmgcJnF/dHsto821cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU5mw-004WpT-7F; Fri, 02 Sep 2022 12:28:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU5mt-004WlW-9U
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 12:28:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3756B82AA5;
	Fri,  2 Sep 2022 12:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BD7C433D6;
	Fri,  2 Sep 2022 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662121720;
	bh=e+U24dMk/hVmt2QABbAWhHrVrdQ9lGxzE6AGBgzMrRI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=E3W+l5+/gpwtSpcsYI0VJkC/skmdvbyU+PoHcuKWcwXepIhQy1SFg2GYE2akBR8U0
	 lhRhUcQfIpbk8YINp/tXwNKd3YsA7wVQq/7yogJahYJ/OuJ0MabBhkPB0TZMM3wFVM
	 FohhOINOoZ/yKFXPfQ4WxAOfYMAFB1DtrTzUcJrf0foAjHKL2lkWt7B8pqIBQ0od1M
	 21yJnPVK1Pi0sls5hZplEjj06mIj39qfigt1LXPHM781P/hl8WNuQupN4S7cIrcjdO
	 rk9D580BNdSaIgzQoBWvpPtq4MEC2uW2cSadl/wNpIuTl2GxMzbZCtftnOPbVsavel
	 GSgjUotDLF9IQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Add support to connect to non-transmit MBSSID
 profiles
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220901080616.29414-1-quic_mpubbise@quicinc.com>
References: <20220901080616.29414-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166212171811.9935.14952396417048197935.kvalo@kernel.org>
Date: Fri,  2 Sep 2022 12:28:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_052843_506529_05117F0C 
X-CRM114-Status: UNSURE (   9.76  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Add support to connect to a non-transmit MBSSID AP profile.
> 
> Non-transmit MBSSID profile parameters are passed to the firmware
> via WMI VDEV UP command and this helps firmware to track MBSSID
> profile within the multi-BSS beacon and report beacon loss if
> any.
> 
> WCN6750, QCA6390 & WCN6855 firmwares have the support and hence
> enable the support on these hardwares.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7d992bd4615c wifi: ath11k: Add support to connect to non-transmit MBSSID profiles

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220901080616.29414-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
