Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8130EC54798
	for <ath11k@archiver.kernel.org>; Fri, 23 Feb 2024 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSs90dGguPZ/DQDzasHSXbgOg8qjRMl4QW9O6LSoVqc=; b=HRHNXB/6EMB+BiUfLrfM9J46uM
	Pn37Q+YgkhjUaR35CJGqNDE10sDzfx8bhC1Ah68TcQ465RDtbStsF0DcCpxtyhrEfp2XXB+44eUA1
	RN+hIaMxpy6dJmSXiXgPeRCcy8BC8PyAJEAPgmpcsH0aJP/NeEOjYtzO7/KuozjVrJKfl0JGwWAov
	sxXp7BqdZ6RWwSLoEtx1ej+vMJbd4rdQC3jL0khpKFdlnIBVF/w1W075H95N7QM8CPYw26x5wZkrx
	p/zcEElIa2ztFZvtF05FWd6F86NjyRb9gJxEDlkYQTkzi4jKfTNFQ7eYkwqRGjox9Nrua2gheoOp5
	V+TyehDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdXr1-0000000A52Y-0dl6;
	Fri, 23 Feb 2024 15:52:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdXqq-0000000A4wt-0ZsY
	for ath11k@bombadil.infradead.org;
	Fri, 23 Feb 2024 15:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DSs90dGguPZ/DQDzasHSXbgOg8qjRMl4QW9O6LSoVqc=; b=b0ql+Y2BlQf3iHoHSrlz7nhaFs
	mqt5PAj89HbA/94qmHogIxZK465cauoUOiDpj0HGjZWPyGoooaGzogCa6wYg+0mgtUVw7h6w9ydU9
	n6z6fUpS3NA4BX2QuY7YfDqpjO7yVdYXHBKcb0ahpHKfI6CtScNc34KnzOqVjo4i66vv0IyZRXcw9
	zENmtPseur5p2s1t3yQEphFiLsXQyYZrTpP+9p97UOh/L0WOWApvEd3cT3nsZOGQZJM3s11u8NpOJ
	Prl4htoS0OYDbV5FO3mNFYpndC6IVe4bUB1TCMZVrAdrOgSj4mCyDGuShJVb9B5sK/A0iOBjWc9gR
	jCvEQGww==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdXqm-00000007ZA5-3TS4
	for ath11k@lists.infradead.org;
	Fri, 23 Feb 2024 15:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D78D8634F6;
	Fri, 23 Feb 2024 15:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B540C43390;
	Fri, 23 Feb 2024 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708703548;
	bh=FmdvAEI4lkHI7aqgmEpRIL+TMUp4vr6etufiYyBm5k4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GHolXJUfZDvh0DEYzWBve3v49ummEY1OKRHt2DHCJl2wD/M/VmTKepWlBp6bCXmSY
	 ssc/1vWwgUnvirVvvS9QsVOJxGgFBzP6LfutylfpEcKYH1XHDCwTbt6JGS8aBv8izd
	 0wxFNEmLB/OXXmVx6OWYijOKHFuxEPhj4/B/B1SEqRpVxMnybmxnJ9dSdu2db+9zQ6
	 iFEqdR0drT1sor+NfGd9SXEgeUxIGOvBSfDNxl6IiB5047dr2U7REWVF/Enk4bPqyK
	 V9mXkmpXj14ceVoM9niaIpoKtqHGt3+gsm/fAQQSqJ5I2UTIn2LNdma7WFMRZgtC9N
	 KdGHYfFtRymdw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/5] wifi: ath11k: rearrange IRQ enable/disable in reset
 path
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240221024725.10057-2-quic_bqiang@quicinc.com>
References: <20240221024725.10057-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170870354531.2702005.2457317926886672852.kvalo@kernel.org>
Date: Fri, 23 Feb 2024 15:52:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_155237_122138_8131CD92 
X-CRM114-Status: UNSURE (   5.77  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> For non WoW suspend/resume, ath11k host powers down whole hardware
> when suspend and powers up it when resume, the code path it goes
> through is very like the ath11k reset logic.
> 
> In order to reuse that logic, rearrange IRQ handling in the reset
> path.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

5 patches applied to ath-next branch of ath.git, thanks.

d455e805de70 wifi: ath11k: rearrange IRQ enable/disable in reset path
fbb2a14afe00 wifi: ath11k: remove MHI LOOPBACK channels
5f3288a34878 wifi: ath11k: do not dump SRNG statistics during resume
361c90ed3647 wifi: ath11k: fix warning on DMA ring capabilities event
50556081e09b wifi: ath11k: thermal: don't try to register multiple times

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240221024725.10057-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


