Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84133C27C53
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIUSf/FyiWJFcXBiVxq9ResCPBn47ovO95Ddvfz+lpM=; b=i1bkJWFD+FpK/gGqrLsb/G1ySJ
	NayGvEDqdt9+mZrD9e2PCmuQUn8I6Bt6c6hb0QWtocbrEHEY2LnDSNGWQV0gJ8GrUdZEFgWmeoZ2d
	gQJe8DEb4VCS5XbCOB/wSLWVN6VOZH3eA3h5JY8AnOcpj5i7oxxWL0O00As+G44gZdm0zJWNCBpJv
	U7iaizcLOKKV3OQHKVosNlrur9BdMRIB06L3Tybm9RzDkhD9C1CgiWRAJXmdfjcQNgdcYMIeNjF7Q
	dpurf3O0Uri4zZfjnmbzBKg0gNzYIiNqQSsmDnyL1tUH5s1+i9To7OBZemluplOOEQRAzE9h8ltbi
	IEDIsbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvqn-00000001PG6-0Cj9;
	Wed, 19 Jun 2024 13:59:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvqk-00000001PFY-1Z1R
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 13:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35F2161345;
	Wed, 19 Jun 2024 13:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDA9C2BBFC;
	Wed, 19 Jun 2024 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718805584;
	bh=GP053fVcCmP+9oGR31yF9XjPlWhocHir6VNmV2sdCFk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=AOK6em7ck0o0p7BUVC3Lpw1zNBYyxHKDzkgdf9T3BH+f0GHowO/sKCg9afdQP3QtH
	 5K27ZYs+unRgkTsSWjVlapb0FElZ5YMPIHkQSLonCysFEZeVTJcscbRIEGNhveEpjH
	 0QcogrpSKCu8fwl+S2WrvqHY8t9GUYwvHTsfSxWxP2lcAPuBaWiMkLZ6hC4QX34BnC
	 qKqI34AQMPkNSKJ3rmG3DKeCa8LYXVVUgSEayKlrdBbFa2zdOybNhMqB6I2voxNjJY
	 lhe+QFZM88q8H6tCocj1xqUN1n/WhFQ3Z28Y34EZLCTFnd5VByGCTXFY4WB8RjmjQD
	 04cZFAJFhML6w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: fix ack signal strength calculation
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240611022550.59078-1-quic_lingbok@quicinc.com>
References: <20240611022550.59078-1-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_lingbok@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171880558194.581414.2662611449809906719.kvalo@kernel.org>
Date: Wed, 19 Jun 2024 13:59:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_065946_514587_E207AAD4 
X-CRM114-Status: UNSURE (   8.77  )
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

> Currently, the calculation of ack signal strength is incorrect.
> 
> This is because before calculating the ack signal strength, ath11k need
> to determine whether the hardware and firmware support db2dbm. If the
> hardware and firmware support db2dbm, do not need to add noise floor,
> otherwise, need to add noise floor.
> 
> Besides, the value of ack_rssi passed by firmware to ath11k should be a
> signed number, so change its type to s8.
> 
> After that, "iw wlan0 station dump" show the correct ack signal strength.
> 
> Such as:
> root@CDCCSTEX0799733-LIN:~# iw wlp88s0 station dump
> Station 00:03:7f:12:df:df (on wlp88s0)
>         inactive time:  75 ms
>         rx bytes:       11599
>         rx packets:     99
>         tx bytes:       9029
>         tx packets:     81
>         tx retries:     4
>         tx failed:      0
>         rx drop misc:   2
>         signal:         -16 dBm
>         signal avg:     -24 dBm
>         tx bitrate:     1560.0 MBit/s VHT-MCS 9 80MHz VHT-NSS 4
>         tx duration:    9230 us
>         rx bitrate:     1560.0 MBit/s VHT-MCS 9 80MHz VHT-NSS 4
>         rx duration:    7201 us
>         last ack signal:-23 dBm
>         avg ack signal: -22 dBm
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

94f228ac4f5b wifi: ath11k: fix ack signal strength calculation

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240611022550.59078-1-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


