Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4BEC54E66
	for <ath11k@archiver.kernel.org>; Wed, 13 Mar 2024 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAZQM4tB/W4u0keqVYtJTRB5pxovCdHhPH5CJaJYSFU=; b=MQfmSau8XJbc43DHwap/D0pOiW
	VH8Bv1OiXCb63yhgnmNMvri1gyJKDcaGo8+0Nw/Ia5VIZbRLvQYLA8b9odRp+XEqygSd40MmLOYu+
	N8gyOfJJNfi3nGZEu5uR6PuNXI0UGa52AahzIhw/eTBX/SCHAZn5mt5DyWTyqBbYszS8qgi/17iJK
	bOdLcpw2wX82Nqr98pZqqqbMq60XMQZ0qCcfY0UUeh+Qyq3imLipkBt8GU/FB0IabhhZ7E4oBFSUF
	qQHeiUcbXqWuoLhME43she/7tJ6QCuNNbWQ2m1fBREbfFSetvSXGLP/WW7W3Bd2julhMx3MXgZd53
	q7vgsXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkRL7-0000000AkR0-0ZdB;
	Wed, 13 Mar 2024 16:20:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkRL3-0000000AkQD-3Fab
	for ath11k@lists.infradead.org;
	Wed, 13 Mar 2024 16:20:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57FE76148B;
	Wed, 13 Mar 2024 16:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118EAC433C7;
	Wed, 13 Mar 2024 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710346820;
	bh=3wzUd65sE8PPvf1zN3NvhnEeMECYa7wGQzfd/IvjO6w=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gUkWXc1Vna8dqL+5VHZMrmtHvkyLl+rrknPwD0/f1Z0sVi+lSmBSRbZBsaS9LGVJI
	 XdqjRf6HkoBS6mLuoGr2Vq/IWr9LOmv7+JxfayMxusLVl6RXAYloO93MigHAqxJNHw
	 0vh19tK2LCy/wvLCf0N1MRBLaY6ZvcwQoLlvyv3vcW+Ljmuhz/9ayEs9ZOKWKoMg8N
	 Vhx0Q9+YSqWNe2gxE1YLbUS32N7JG287uLY+i4IerSCqyBl4eQAETT/BAavdG0eA0x
	 NabcnvywWlPsdoqwOFXgCJsOrnJP8Igw0AjhKSKiXaCzwOv5IoZg66UGC3MPMP7tXa
	 GHhpaWek6lMtA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: modify the calculation of the average
 signal
 strength in station mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240309121129.5379-1-quic_lingbok@quicinc.com>
References: <20240309121129.5379-1-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_lingbok@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171034681684.2322265.9660346495295315212.kvalo@kernel.org>
Date: Wed, 13 Mar 2024 16:20:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_092022_166256_068BFB36 
X-CRM114-Status: UNSURE (   6.67  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> Currently, the calculation of the average signal strength in station mode
> is incorrect.
> 
> This is because before calculating the average signal strength, ath11k need
> to determine whether the hardware and firmware support db2dbm, if the
> hardware and firmware support db2dbm, do not need to add noise floor,
> otherwise, need to add noise floor.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

What about AP chipsets like QCN9074, do they also work similarly?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240309121129.5379-1-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


