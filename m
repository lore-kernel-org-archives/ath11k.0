Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B0EC43334
	for <ath11k@archiver.kernel.org>; Mon,  6 Jun 2022 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/imuwmf8Qgnux0Nr9VL7NaD7ibYio/3fbqp7vAhwiLg=; b=0JPE8sBdrSGYFI
	XvYmQvrJJacSpWRMmOdBeQPzhA8Kwh9AFt329RJ6Il/TmffJu5k43aD0c4iYaKKM6USkuvGaiAdZ6
	McclbXuJSNti2y7E13wZxDznvedb6b+RpwPj0jXCHFu397mrpL+TT69fgHX0HtfPpSG4WnklO8zHF
	vIkXKg8U5jnMN/nJxjxeDNoNMIK12IpB9etNd8CfS1k7wtR3HKTsi5WaREDs7s2VYlqrAu1VZGDiL
	7NvwbLW3mfCkzmuepO6h7FqmW/9/5fKYcKO3qb0CwxBNb2l8drP8JJEokTz2ZC8tv0tCs3+knzkZh
	ogxFBt9gfQBOcAyWbEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDS4-001SOI-Qf; Mon, 06 Jun 2022 14:11:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDS2-001SNw-Lg
	for ath11k@lists.infradead.org; Mon, 06 Jun 2022 14:11:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2256F61333;
	Mon,  6 Jun 2022 14:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEEFC385A9;
	Mon,  6 Jun 2022 14:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654524685;
	bh=ohccdRSsVDMKx6d8dgA8ZrbzxQNlb32a5JOCqtvymHY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=u9Xca3H63yHA1V2EmJMpO1lxvYNYWcCaG4Gx83pueHsITyJNN5beqtCW5orL44DMm
	 sj+fslmMuBg3B07ZR7yynu7mprDB+LxCRmycPMBUS6hfF+0E3fUHL+fmjN+wVZvImw
	 F2rF1yORgVYm3MeJfhP+udyDkO/MJTOA1tFlmIQ3zuiRIo+2bFbevSqg/+Pw03X047
	 dQQDqqlA81bphi8WrpGHWyrwB2V5cpdrPLwQZHdkmO17ZIW9depUg1fhcs/bOrz1lE
	 3kdUtKYZemMz496rQ+1586XYgpPWFEcWj0P7WWeS8GrjNLHi/vIt1WkhmZkgiAshcf
	 axoWJUgAfd3qQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix warnings reported by checkpatch
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220602131350.29486-1-quic_mpubbise@quicinc.com>
References: <20220602131350.29486-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165452468243.15301.14990186060514165573.kvalo@kernel.org>
Date: Mon,  6 Jun 2022 14:11:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_071126_793365_CFDDB558 
X-CRM114-Status: UNSURE (   6.52  )
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

> Fix warnings reported by checkpatch tool. Below are the errors fixed,
> 
> drivers/net/wireless/ath/ath11k/hal_rx.c:760: 'recevied' may be misspelled - perhaps 'received?
> drivers/net/wireless/ath/ath11k/qmi.c:2232: Prefer strscpy over strlcpy
> drivers/net/wireless/ath/ath11k/qmi.c:2238: Prefer strscpy over strlcpy
> drivers/net/wireless/ath/ath11k/qmi.c:2662: Prefer strscpy over strlcpy
> drivers/net/wireless/ath/ath11k/mac.c:7836: 'atleast' may be misspelled - perhaps 'at least'?
> drivers/net/wireless/ath/ath11k/wmi.c:6566: 'succeded' may be misspelled - perhaps 'succeeded'?
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3926e0c12238 ath11k: Fix warnings reported by checkpatch

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220602131350.29486-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
