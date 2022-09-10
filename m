Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD7ECAAD5
	for <ath11k@archiver.kernel.org>; Sat, 10 Sep 2022 06:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBgJqvUTy2hpQkSF+J060f9e4RQKE03Klra2lPFMZjQ=; b=kbiDtddEvSYUrv
	1C647y97YYLc5Ft8O+Nvtz+tM48A4VuZfokM0Vm6uDXPTw3eI7onO8zieQEdGQxaiihPOis5ZjXwB
	i6xXTA9V64Uif7K50tBHVr4EoaUHajjq6F13t+toVhF0liMyvX/Jw2l335e5YT1y5eQ9+CeHnFEFp
	A9nrA5znxVcUMhYM2EWvOfxxQMLj7Oir2rXSp9r4Da1riIrgCi295P4wcSiK3xJX/ZXeJjJNKk9+C
	9Q1MUTUWV/qrNZXdkFq1rGFhbFOHcXHQ3kgeGu7MBaHB6JYbLZpllSAaXcYUfSnJtgY64HPxAyYsH
	EtBViIsA7lUVaqHDv7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWtyN-006jQl-RP; Sat, 10 Sep 2022 06:28:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWtyL-006jPb-41
	for ath11k@lists.infradead.org; Sat, 10 Sep 2022 06:28:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7F9CB806A0;
	Sat, 10 Sep 2022 06:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921E9C433C1;
	Sat, 10 Sep 2022 06:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662791286;
	bh=4Az+6COg6RQIv37I0MWXhYUrsXE7s/Ds8LZAdFk0tgw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=T9HuTeo7TKQOWFX3smE2UljmvqUIzZUt/Ds2L+UTQkqzbpM7Nxjn7YTi4/tz7ur73
	 o4bzsqkzAGQH35/Bi4FMVY4CdbE2qpHU342sUns3blS+61AFefdr2i6q0xy/0+TXHY
	 O23AvtI4arHMLbj8GQ+SA/sz4OzjMnx6sRwUogxQsUzgndT/OJVFBkmd4vylJjQ1vr
	 /Gu7RyFXX/9hxSnS+MlbrbDvE/kSphGiicCCmYfD2mKDKBOzMPYXis09aFzrt9IBYw
	 weK631shuos2CUuMCYC3q2xrrMGCTrnc0CgpGgJYFwMMTD1+ver+sHZ+TGbWPW7XhB
	 OaJEdhwaXpIXg==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] wifi: ath11k: Enable threaded NAPI
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220905071805.31625-2-quic_mpubbise@quicinc.com>
References: <20220905071805.31625-2-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166279128337.2050.17984018699981295216.kvalo@kernel.org>
Date: Sat, 10 Sep 2022 06:28:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_232809_337865_6232C15B 
X-CRM114-Status: UNSURE (   9.64  )
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

> Enable threaded NAPI on all ath11k targets. Unlike traditional
> NAPI poll which runs in softirq context and on the core which
> scheduled the NAPI, threaded NAPI makes use of kernel threads
> which are under direct control of the scheduler and helps in
> balancing the NAPI processing load across multiple CPUs thereby
> improving throughput.
> 
> In the case of WCN6750, enabling threaded NAPI has improved
> 160 MHz RX throughput by nearly 400 Mbps. Similar gains can
> be expected on other ath11k devices as well.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

13aa2fb692d3 wifi: ath11k: Enable threaded NAPI
7636c9a6e7d7 wifi: ath11k: Add multi TX ring support for WCN6750
97c9e37c7a7d wifi: ath11k: Increase TCL data ring size for WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220905071805.31625-2-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
