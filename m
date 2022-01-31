Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48116C433F5
	for <ath11k@archiver.kernel.org>; Mon, 31 Jan 2022 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/o7V9yGROEDg5ON/IttV6iTC1KTDdQ+8+0bVupoJ+x8=; b=DO605uvfsFepqf
	G3NVIwEtD0M3NgQ8o8x7FWqVg210pgl+iB25cHpzJxp4Sx4QLpp+ONixPCZqj6FSS6/w3DYuuXlMn
	wGI6FvQGydHuFHqvFaV8CXHNi8uMKy74xTvDMU/L2wokQZSyVE+ewYuh4iItHKh6BLeuPe0+bYSgi
	AVL5vGZ0v9CwfynQ6KLzrhSLONyuzNYtn99h6uorMqPO7irKDXQfaSwJj8ft4JGmIN5SiC2tm6LJt
	gt5toBmXDWurFls507bdlZQGr9bG84nbECpPBYPx5GqfEspiE8iy184qq8qAL5Lp7jcCEWZOFhtOY
	wH/JdA/WP+G42uOcegxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEXBj-009YPC-2d; Mon, 31 Jan 2022 13:57:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEXBg-009YNy-5k
 for ath11k@lists.infradead.org; Mon, 31 Jan 2022 13:57:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6728612B3;
 Mon, 31 Jan 2022 13:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396A9C340E8;
 Mon, 31 Jan 2022 13:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643637463;
 bh=GDy5i71yvezvtbREtneGSnT9nz9OBz4VUrQ8qokdP18=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=kBL8jqIONqJ/q2rZYU6QgLs06zcvzmwIYcOXZ/wfo9f09DQvOQiv5igrLfdJvh7/k
 yVLYH2vdLW5mQYbOmwnBOzeh4DiATpFWg/vrqQcnMEZrd8uKFN0u23scSDO/Cz6Apf
 St+amiHP+1045+mhHRTIcdOvgZOTVbE9ZBGTVLdLzi4pp/D3G3I2rNEKXysuksCJvX
 wwz0VoVmkH8eUoHQL4mg1CBFoCQF6jorN1pkGt/y6FSys/kyvw3V+J7EdXxou9UVkw
 /t7aHFqiIdP8dDCMS01rQGHvOcATazid0rJ6we8RkYsQ4mt/5Y21+suMlwNcVeN+rC
 p1KHa2egjwt9g==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Rename ath11k_ahb_ext_irq_config
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1642583893-21485-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1642583893-21485-1-git-send-email-quic_vnaralas@quicinc.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164363745873.22527.1638672653095490775.kvalo@kernel.org>
Date: Mon, 31 Jan 2022 13:57:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_055744_284966_D48FDFC4 
X-CRM114-Status: UNSURE (   6.45  )
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

Venkateswara Naralasetty <quic_vnaralas@quicinc.com> wrote:

> Rename ath11k_ahb_ext_irq_config() to ath11k_ahb_config_ext_irq()
> for just symmetry with ath11k_ahb_free_ext_irq().
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a76ed59163ba ath11k: Rename ath11k_ahb_ext_irq_config

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1642583893-21485-1-git-send-email-quic_vnaralas@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
