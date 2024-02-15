Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B887FC48BEB
	for <ath11k@archiver.kernel.org>; Thu, 15 Feb 2024 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYnJ4xxVjooeoKiIhEFfGrYkI30qB4uP6f9caKcD7Nk=; b=UK/NIp0cbkZfWvMK1jHmyitr6A
	qpg0CJwp5OwORvDtSpEL7yyZcheokMqBu+AmzNSvhUSYCdoKMaWj45qFPLquwIpaSEH0wlpdPAf/Z
	iPcUz+TjleUoDkAS7a0ZTFS0A6+MFsInT6bC8MnLV2mMhJ/osVmed/5LhKkqAgBtM8FZ0AYKlI5Ix
	DQNr/IBV7/JPbtiAR5lvgr2CaC3X2CKzTEw2dGiJ9A2QpprlWnRIO2Hhy4Jftwnnjuhp42hVsNv4H
	KLqxDTX2G+5k2WW75JTPJfAtoL+OBzOC4wahIRCy1kliqKK5uIEyMfat8OVsGygc3atoPLkvOzTp1
	GiruUd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZqy-0000000G1Lu-1UTW;
	Thu, 15 Feb 2024 11:24:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZqv-0000000G1Jl-2Qva
	for ath11k@lists.infradead.org;
	Thu, 15 Feb 2024 11:24:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E7BACCE25CE;
	Thu, 15 Feb 2024 11:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD939C43390;
	Thu, 15 Feb 2024 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707996267;
	bh=e9t4tQYz922y7RN5hEL4FP0g34f5lUia3j7hxRXj3xE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=RBpdcnPvzXUVHrmoxV7aTFdDfQxiyWk4rGAVSfD/iaQDMwXhH7z6ImpxoAgc8gQtT
	 uizUf4q0fqIgdJPYu9J/sl0VwqWyyGzMnwRr7/cBSXl5WtdR4ZIAed10LwWEKRSsH5
	 DTilW6inGBBevIOCQpWI2+aP4LBAA9RJzWdyp2PrGiAO5KaOC/6BUdFLW9D1wZYzWA
	 icV2FNr6Jkn7eprXN3rdpAjaImrfEvdbeD+Bs2DlWnwba/ReihubmU9ddf4D5zJ5q8
	 36V1oHtvvun87jrcLsAFOtwULblmWNGBoY93tlm1XnhZdj09gD8SWN7X7rHlKqrnPS
	 Vvwd14dNorjLw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: remove unused scan_events from struct
 scan_req_params
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240211151036.1950292-1-nico.escande@gmail.com>
References: <20240211151036.1950292-1-nico.escande@gmail.com>
To: Nicolas Escande <nico.escande@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170799626510.3860606.15664868735604637285.kvalo@kernel.org>
Date: Thu, 15 Feb 2024 11:24:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_032429_841239_BDBF5A17 
X-CRM114-Status: UNSURE (   5.18  )
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

Nicolas Escande <nico.escande@gmail.com> wrote:

> As discussed lets remove the unused scan_events field from struct
> scan_req_params. Also, as it is not needed anymore, remove the underlying union
> wrapping too. No functionnal changes.
> 
> Link: https://lore.kernel.org/all/4be7d62e-cb59-462d-aac2-94e27efc22ff@quicinc.com/
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3ab6aff5793c wifi: ath11k: remove unused scan_events from struct scan_req_params

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240211151036.1950292-1-nico.escande@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


