Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E408FC433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B4161BD3
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8B4161BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQSpc7kLnstNdFSeAbLzPhe+AfmfdSiGO89yzAc2iw0=; b=FIVoAAxnaFDffx
	nx0FJCdQlnXKVpkB2k7kN+p9OfVWHvKzXcQ3OB0E+2Y8M8F0zGkgX4eYd+ALnQyM2Zo6j23e+AtDE
	CDDMwpu3RH7D3plcMdwOogpBLnyXdqi3EeNkZEXwKjFERgLXzLDHuKN47Kd1/i3RE+Nk8Pp57k2vY
	ksfpefBpXiNeAYVifFiduyA8pH6jbU4EuUqSvQ+XHGKSZAlgfDBb6cRcp9UDifJ7VKZL4upIs9Zu7
	Jp22rNOuGotSxf62wZzhLn404J+8Yu0r0ImYfQaj7rDkr+WgwBF90rCfS2jMc8uBfGPytTMjGqM2n
	/AaIGC65vUsHUwmGXnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYd3-00F0X4-QT; Mon, 15 Nov 2021 09:50:21 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYB7-00EtqG-8c
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:21:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636968091; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Gb9bE5w+cQk9K3VO+iQk16zoogSAWw3UVmkHgcsztzs=;
 b=cOva/x05MEYAWNKgP5iOYgEsYzYZL9SXbKGWgwRZdtyJJep0U6VHfvYT1/gYTkTSoIVT0M2o
 JngVlVYBEjs6I4FFfDrPZCLSqYcPlnXPHm8uRDwIWnFfDOuUvNgLnuExKGaf9fUTtvSVMY5k
 VJ34a+oaW4vYnKJtaveaj39Oidw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 619226964db4233966961804 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:21:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E13A8C43618; Mon, 15 Nov 2021 09:21:25 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 574A0C43617;
 Mon, 15 Nov 2021 09:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 574A0C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix target assert during channel switch
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1636644002-25446-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1636644002-25446-1-git-send-email-quic_vnaralas@quicinc.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696808169.13305.15799037542791194582.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:21:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012131_627471_4996C261 
X-CRM114-Status: GOOD (  11.70  )
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

> Currently the updated bandwidth for the peer will be configured
> to the firmware after channel switch from the sta_rc_update_wk.
> If the updated bandwidth is greater than the configured peer phymode
> during the peer assoc may result firmware assert.
> 
> For example, initially AP is in HE40 mode and the peer phymode is
> configured as MODE_11AX_HE40 during peer assoc. Now user change the
> channel width to HE80 then, the peer bandwidth will be updated as
> HE80 to the firmware.
> 
> This will trigger firmware assert due to peer bandwidth is greater than
> the peer phymode.
> 
> Fix this issue by sending peer assoc command before setting the updated
> peer bandwith to firmware.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f187fe8e3bc6 ath11k: fix firmware crash during channel switch

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1636644002-25446-1-git-send-email-quic_vnaralas@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
