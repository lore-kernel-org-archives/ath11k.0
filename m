Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB98C25B10
	for <ath11k@archiver.kernel.org>; Fri, 10 May 2024 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCEMuv8BTNqITNiWoBmlEd6p9ZCB/YHE6vsTffCJw0E=; b=CAAUpWHZNlRTjuSU1mjiY/Y6mn
	d9fuFwroCFCjUh1fXfXXDbKfvkNVIwquxozQgWoYRAmHEbb/A438qYCRWTrIMMlDsRE7MniSJtTCN
	/wx1omYE3mTxvibncCAiao/MCy29aeGi3ZJNEoiSXRoRLKzphGNK5/0fkG4SoF4YuuF/Hu1uP3KrM
	rBaJQMpO9NBO//apCLzJAVvLlRn8G+xxhOT5yE/6XfYBwzpo2XwQxb2Ow5PgBdEsySx+S9a4oKX6X
	0SnYCyZ4W3uwwArwvz1JPBr5b6PbJOwxSgxFNhJpAFkS1jHm6p2vKeb8/fcafZAisFWLPov1WzH52
	nL+egbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ork-00000005ARW-3l7F;
	Fri, 10 May 2024 11:56:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ori-00000005AQc-0p6n
	for ath11k@lists.infradead.org;
	Fri, 10 May 2024 11:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FC6461ED3;
	Fri, 10 May 2024 11:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BE1C113CC;
	Fri, 10 May 2024 11:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715342199;
	bh=Sg1yNj7sz3TgmJXgjsW9mK/1ks9fy6gk2t2h724Zu/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlp55sxB0TjgbLIK7NtwytShjU39kvivxmsofCkbGqorK7SU+HQlQoIueRiZ22J0W
	 Lf+8QPYqjysh/K37yBrG2GvvzkfZkCdSz+gqsolYELyNW5y5BTAEAi8YakZI7KD0bG
	 0gcC2eL/CbrNzZy9KFQDjARsCrkrUML33SAQkha4CLsMBznCP4nVZBX/q46hCwQGhB
	 a7hbdHT5SlulYji9U4WgPGnqMhgTeJgzPQh3ek8/rz52pQOdvlVBDV5UYIaW+/bFOq
	 35UM359xepPSAO7FHUT+eb5qzRpBbvWlUZn9vpu/nrrrjaKv7sJyBvWCMawz6sd5QI
	 0Yjoa3jz1X/rA==
Date: Fri, 10 May 2024 12:56:33 +0100
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>,
	"open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH wireless-next] ath11k: Fix error path in
 ath11k_pcic_ext_irq_config
Message-ID: <20240510115633.GS2347895@kernel.org>
References: <20240508185902.70975-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508185902.70975-1-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_045642_321602_961AA6E4 
X-CRM114-Status: UNSURE (   9.33  )
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

On Wed, May 08, 2024 at 11:59:01AM -0700, Breno Leitao wrote:
> If one of the dummy allocation fails in ath11k_pcic_ext_irq_config(),
> the previous allocated devices might leak due to returning without
> deallocating the devices.
> 
> Instead of returning on the error path, deallocate all the previously
> allocated net_devices and then return.
> 
> Fixes: bca592ead825 ("wifi: ath11k: allocate dummy net_device dynamically")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Simon Horman <horms@kernel.org>


