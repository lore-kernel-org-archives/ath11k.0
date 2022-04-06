Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D31C433F5
	for <ath11k@archiver.kernel.org>; Wed,  6 Apr 2022 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itlj57opSGmM+0FLEF7bztQrljUNDY21XBuF5RuWpfU=; b=NjBWW74PoGsElj
	sauWJH7ApsXQIuobBw3txNWV6l1LU/2GE40wY92gLL9cGvL7dBN7iB1imJ3mS+mI5T2bYAt6bQu6Y
	oaW1Gds5RbInx+VfrSZkzLyBh3DFf30IFWnJVL3FlBqGu9QDZmQUVUrnlF0nWxAyERWxMHY4Oco2y
	bAQhyryziJwIifKXmo1MlqxkP5NIl8pGUCUKANpMLjikUFjTHpKKVcBTIwwvddP9Mgq3HpBRXPCeX
	4SnEfsTkZLDEUgF52Pka5fwaocX8dLShlJZziOJy9DMUxGFhQUq2lgUNYqZMGt7qtQp0dm+OrQurT
	rbWVSou6zaN3kDDHNBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc0UH-004Yrd-PM; Wed, 06 Apr 2022 07:53:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc0UF-004Yqf-G3
 for ath11k@lists.infradead.org; Wed, 06 Apr 2022 07:53:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9354F61AEA
 for <ath11k@lists.infradead.org>; Wed,  6 Apr 2022 07:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4205EC385A1;
 Wed,  6 Apr 2022 07:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649231632;
 bh=ZKS3bP+zoQ863hHbXEVIvhh1eH+0Ni6uGvVD21pxl/U=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=uK0zSkFmvXvDtzEvlDP6GSyjE6as1o9beyqCP0GRYttW+xL48/3HeTaeqAXACIMEd
 rORUFSYSYc1jwQynzKO5OE5P5ieQx/BC5hpOw7XizDuoQO/PAid+IGlMoZuh65fw/t
 7/B9PBK9NNZmOWoR3gTAXyod6Nsq2VC3Mjo1g08sNzU31VTNoVa/jDp9V9edXRRTze
 erWk4uKdMC7T65NkoGbaWFGYPRZqAwBEXZslrnVuFS1dBagjhbl7iKF/n4T3Jd96+G
 wNjZsQoPFG8rh9w84foOUZo1yEt3LVuHlcSZBBZS4q1nRo3wWmkKNEIPVP6fHTHONu
 nKWk1oFiqlC2Q==
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: mhi: remove state machine
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220401173042.17467-2-kvalo@kernel.org>
References: <20220401173042.17467-2-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164923162903.31835.17335207502754178945.kvalo@kernel.org>
Date: Wed,  6 Apr 2022 07:53:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_005355_619718_D97485C4 
X-CRM114-Status: UNSURE (   7.79  )
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

> State machines are difficult to understand and in this case it's just useless,
> which is shown by the diffstat. So remove it entirely to make the code simpler.
> 
> No functional changes.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

5fe7847bb63b ath11k: mhi: remove state machine
4afe7c40380e ath11k: mhi: add error handling for suspend and resume
7dabaa64c04a ath11k: mhi: remove unnecessary goto from ath11k_mhi_start()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220401173042.17467-2-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
