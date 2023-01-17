Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB074C3DA78
	for <ath11k@archiver.kernel.org>; Tue, 17 Jan 2023 11:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJrG4iUrMxbHXlz6VZOYmmi8IuovezyaQ/fy/r7EM8A=; b=z2Jc45Yrsf0brJ
	zz9tZF9E941av5TDBSEQjA8wg7RRodRxVeL5lrYZn8/WLmPOtDKIZwX4MWqr34dUYGH1pIwnWDP0M
	MqdJNvhyYb0CuiOQ5gumQybNIxEMRmzEYKC073Dw3cuzJBd5V4x97hpauBNWLmreroaN9WbpLr28p
	NN7/oLCCj9Lnp6/3JB1Ls5XVHBnymvXHFOOvERZSg5MPfnVXj82Od2BIbHLhRUn9DX8jejzxt+Bqd
	axWwhpvjitZo0g+Iim4bVnns9zPt6h8oJCFxhzYVT/DoBfu0ujTkL7YAdv0COvkc6Do6ASbDmxMIA
	JaSdKGFvHUMJv8q/WyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkas-00E6ST-Co; Tue, 17 Jan 2023 11:57:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkaq-00E6Rb-6u
	for ath11k@lists.infradead.org; Tue, 17 Jan 2023 11:57:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F263BB815B4;
	Tue, 17 Jan 2023 11:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD341C433F0;
	Tue, 17 Jan 2023 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673956644;
	bh=A342a7RFzg4iD3R93Fd5dxm412ejRXcLsmBRWPhFJ70=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=sQXUa+/mrdDCejmva0FEcoXqB3/uVGIW+O0VQENR6TFySI2KxFnDL/MrhAy1+TIl1
	 C/EJbkImkBo5QKj5CImRZEtYZeGjP0Ipw05MYg/J5HZmrhI9b5EgeLX6wgmqxqKIKV
	 /U7/MuSLmJEvfow0bcWO4qmqOCL6Pt9FbHhDuUYtoLfWQqsZAYStrSOhp/vILyDo+d
	 7mlTe9eELwmtmOrPpxrN9wl90JPoJ4IONXigHeusxKF9ElKp5mt35l/y7nroH6MUtF
	 ox0jeKrxUvQ1h+aFhqoBJeW5sJLrBNBALtb6oN+YUr0WL7QP9onfAOL4M8SDdv9hVT
	 b8SbgBplTJL+g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: add channel 177 into 5 GHz channel list
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221220101912.30816-1-quic_wgong@quicinc.com>
References: <20221220101912.30816-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167395664181.22891.8452249494456590360.kvalo@kernel.org>
Date: Tue, 17 Jan 2023 11:57:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_035732_425349_CFC928F5 
X-CRM114-Status: UNSURE (   7.33  )
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

> Add support for the 5 GHz channel 177 with center frequency 5885 MHz and
> operating class 125 per IEEE Std 802.11ax-2021, Table E-4.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e5e94d10c856 wifi: ath11k: add channel 177 into 5 GHz channel list

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221220101912.30816-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
