Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6FCC433FE
	for <ath11k@archiver.kernel.org>; Mon, 17 Jan 2022 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZwwEiPJ4OIz/PVTxzHp1YqB/HSXfR22nu3w1hcda4E=; b=Xe32JVrgjMq7Wo
	Q7vhuNPeZNKAYzWCrEEpcw7PeCiJAXtr13lSIOZSOzId0s4hIaIqnYJlzYgwqRApO6XafeuzoiYd+
	Ic11F4LjaTvLaIaPm3wAmW58J/CXCd9B7sKxzggela5uI3uKNW3BdjffGakNSs1h/2/qC/Wixcr/r
	siyofEd0vsPB5WX8NvetxePjqBPfa+tkMpSBi9zkoGoLpXHhh6m+vY0bm+965+tU+E0twlz9SNJHE
	bJp80/YJUKijlariFJCc/dF6WBGpJw4wgbn6vn/AkWTky5AfzoP3NOMB1d1VvzzhgbYd/A9In9rQj
	Bsds6YuyMZH5KApfm8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Rki-00F15R-OH; Mon, 17 Jan 2022 13:08:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Rke-00F14J-Eb
 for ath11k@lists.infradead.org; Mon, 17 Jan 2022 13:08:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 901D6611E0;
 Mon, 17 Jan 2022 13:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE88C36AE3;
 Mon, 17 Jan 2022 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642424927;
 bh=mf/sb1Cwt7TIVvJhl71c/+zQwiXZL7+LbRn7cUY1d90=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=fg20wILmBQ40+cptowW9Uld4aqiyZr3K0gUxFhuAJcfYRA3BrBxKbTNLYuSRU8Xsv
 rM97uw7WR9mqPxn8BVUabO6FReT3b8Xkw50sfNnQWBLXAsrnX0R9jyw9rf8jwGWzUp
 ClnKjinOvLWZO1v+Q9gPkZiAes1d57eoNR9ZqEMlGVNU1j6JfZpXZ4lV6gDh5KftjH
 oGH+dW4ckjvW5ASWAJ6Mv+BVPfEeAB1yQoQaoJ9anjrULD/ADBq/USMm2PPzr1dbnv
 89tze00nO8fGXq9IpAw+TwLD7mQqXMJO04cpLEd3ttY3J67000T/PfiYuaudphQzOQ
 dOqsi/vKdrXHA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: set WMI_PEER_40MHZ while peer assoc for 6 GHz
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220113023145.14292-1-quic_wgong@quicinc.com>
References: <20220113023145.14292-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164242492251.16331.2627237965817574376.kvalo@kernel.org>
Date: Mon, 17 Jan 2022 13:08:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_050848_563946_3B36D8AC 
X-CRM114-Status: UNSURE (   7.31  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> When station connect to AP of 6 GHz with 40 MHz bandwidth, the TX is
> always stay 20 MHz, it is because the flag WMI_PEER_40MHZ is not set
> while peer assoc. Add the flag if remote peer is 40 MHz bandwidth.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Fixes tag

  Fixes: 2cdf2b3cdf54 ("ath11k: add 6ghz params in peer assoc command")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

Fixes: c3a7d7eb4c98 ("ath11k: add 6 GHz params in peer assoc command")

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220113023145.14292-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
