Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A3FEE49AB
	for <ath11k@archiver.kernel.org>; Mon, 21 Aug 2023 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYcY6RM8m+Q2t4Vh13r16zFS/Q89sELegPQoBStwBis=; b=Fpl9QU9c0yMaNo
	CigYoNGjvlRFzQ7nSBOylNU2im4DupOJqiJC+4TnjVJZgG20v4+PTxUe9tKQOGiP7zynYdVrjMmnH
	AubAVhWCq0VQiPJKtNH36tVHUN5Jiw21cX1F/DCHocRDSJj9ZklFmhkNpz6dDCaNWX0IGDdeXm8iG
	AT2EtzPcukXdrbK5SjVv2thw+5OeasGd5sX4lx8xJiJTfADz/gZ2m+vzdWR/EI8I6zZEZwHY9kt86
	SMCJ9iuW5mxkfY5D7iN4ocQmwFfdVIZD0pI8KoawfBBlUJxSE5QY0/5gZ2XULph0+bgqdaEr1DPmn
	p8IGMPnXl2yekHeD0Neg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY4wr-00E4zM-1t;
	Mon, 21 Aug 2023 13:28:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY4wp-00E4yf-00
	for ath11k@lists.infradead.org;
	Mon, 21 Aug 2023 13:28:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC39E61044;
	Mon, 21 Aug 2023 13:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10220C433C8;
	Mon, 21 Aug 2023 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692624477;
	bh=i1odpy9BeOmNPTWxlRoAMrhEEMbIwj1pbTOY9KKPZeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPkNEl6/sZsNOO7hnkESOVkJiuLB3ImiCAMusKYgsIKfwzRl6u6U5anBlUN0ShREn
	 cbMKP2iDLHEREbGxqIOWnMYvkm/7IgkDFGnIPH8fa4s9+1z7oAcz8lFAuzudl+vRDG
	 8uWQqXoIOsrHcHnMhNHAhSWd2MP/XPeI6h9f1erOjCMSwnJylHYgF/RF1dbd6ovAEw
	 gQ2lEtbxt0NxmU0wYQAUuzubWa+vkNgTnqAWkUSOeCQzyy84SPVXembMrzduKwFYJG
	 GV4fP+oZRyOeYBfMnexNb7d2eTgI1LrMhTTjszLSPGeY73z8KPCp4TFBdwlZWHYUaY
	 VHiGqNnfp9mzQ==
Received: from johan by theta with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qY4wi-0000h7-1A;
	Mon, 21 Aug 2023 15:27:52 +0200
Date: Mon, 21 Aug 2023 15:27:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "Revert "wifi: ath11k: Enable threaded NAPI""
Message-ID: <ZONmWLcRKngCg9Rl@hovoldconsulting.com>
References: <20230809073432.4193-1-johan+linaro@kernel.org>
 <42f78c02-1ddc-cf1c-694f-abf9059dfb60@quicinc.com>
 <ZNNZVsFb3_Dt_NMb@hovoldconsulting.com>
 <85d7c7a3-7a11-bae0-6f37-5da9280792aa@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85d7c7a3-7a11-bae0-6f37-5da9280792aa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_062759_100441_F14D4E28 
X-CRM114-Status: GOOD (  15.73  )
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

On Thu, Aug 10, 2023 at 10:03:55AM +0530, Manikanta Pubbisetty wrote:
> On 8/9/2023 2:46 PM, Johan Hovold wrote:
> > On Wed, Aug 09, 2023 at 02:32:37PM +0530, Manikanta Pubbisetty wrote:
> > > On 8/9/2023 1:04 PM, Johan Hovold wrote:
> > > > This reverts commit d265ebe41c911314bd273c218a37088835959fa1.
> > > > 
> > > > Disabling threaded NAPI causes the Lenovo ThinkPad X13s to hang (e.g. no
> > > > more interrupts received) almost immediately during RX.
> > > > 
> > > > Apparently something broke since commit 13aa2fb692d3 ("wifi: ath11k:
> > > > Enable threaded NAPI") so that a simple revert is no longer possible.

> > > What is the chip that Lenovo Thinkpad X13s is having?
> > 
> > It's a WCN6855 (QCNFA765).
> 
> WCN6855 & QCN9074 share the same driver code base since both being PCIe
> devices. One working and another not working seems to be surprising. Do you
> have a dmesg log when this problem occurred?

I can't access the logs after I hit this bug (e.g. as there are no
interrupts received from the keyboard) but when I trigger this from the
console, there is nothing logged when the hang happens.

Later, secondary errors are logged from other drivers that are no longer
receiving interrupts either, and RCU detects a stall as I mentioned
elsewhere.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
