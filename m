Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52980C10DC2
	for <ath11k@archiver.kernel.org>; Thu, 30 Nov 2023 16:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywAGIzZnRYr1KYla+qNG6gqlVQvwKyTALiXOS8r2ivg=; b=G/cthfCUqVw1Nx0AJmrIip97qE
	ffd0aN4Z3RnqvbheSEbY4+BIBjNmPA5ICc3Fp5MFCa19lkzpf09BCnV6bIbb8RUW20y6g7MUB4JlH
	fxWcu92WXzbCdgkTkKoXcgvxpeOwIb8ycuvtbYzUVg+UdXx2t1jM2Njov7aTay5hDwdEs6yzH1z0j
	WA7UEqNdi0bZz9ILyUoAiZIrD6i5tson9D8hA88udQ1y/BLfgd5qr2qBCMiOMostzOgQCWE3RT11i
	Aj0irbzeO7XG9HqkjnicGMs5+DTDQdu5yqaEaLsmKeIherfk0ZpSoVAFBspbu+JcrHrWA98oM8UO8
	12tU8VMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kO8-00BRvb-1Q;
	Thu, 30 Nov 2023 16:59:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kO4-00BRtm-1b;
	Thu, 30 Nov 2023 16:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 981B161E42;
	Thu, 30 Nov 2023 16:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1E7C433CB;
	Thu, 30 Nov 2023 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701363579;
	bh=22tNHaTzJIBbBfRc7EQUN92ROgJ2k/Qfhg6/ee+vttI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Mny9vh9pXG31dN8btGwzKcZHB9kfNjwbNFFxFznSTbm+otM5Lxe8vMkmtRUxWDdKv
	 0GxCuWJu3/asQOtxGA3rx3tkt4FKhQbj+OrHG/78Nf8AL+DIocUIXt5MvmNfdh4a+u
	 WGoO7tScn7f7MgLz2dbgOsbKPK2rOHB2asgeAfXISZJVfc/m0DGO0/lx5H6IAHcPda
	 AlBvdc8FGtWSOr+u16KjahKc/39bLN7OnGSeTHPzDedgTfwP+7y87e+I1qt6Bcpdeo
	 T83tgWbkIpkgLFxMNlyoIzCD7IugSqZxofSrxNOdOPz61TGA3OsVX1gPk6myG6guBQ
	 WxJDqWZ7JNm8Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] wifi: ath12k: Update Qualcomm Innovation Center, Inc.
 copyrights
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231128-ath12kcopyrights-v1-1-be0b7408cbac@quicinc.com>
References: <20231128-ath12kcopyrights-v1-1-be0b7408cbac@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
 <ath11k@lists.infradead.org>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170136357571.1435047.9848958403770331944.kvalo@kernel.org>
Date: Thu, 30 Nov 2023 16:59:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_085940_591535_D0BF82B0 
X-CRM114-Status: UNSURE (   5.37  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Update the copyright for all ath12k files modified on behalf of
> Qualcomm Innovation Center, Inc. in 2023.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

05205b957661 wifi: ath12k: Update Qualcomm Innovation Center, Inc. copyrights
ea77e9398b32 wifi: ath11k: Update Qualcomm Innovation Center, Inc. copyrights
b1dc0ba41431 wifi: ath10k: Update Qualcomm Innovation Center, Inc. copyrights

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231128-ath12kcopyrights-v1-1-be0b7408cbac@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


