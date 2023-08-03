Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A56C04A6A
	for <ath11k@archiver.kernel.org>; Thu,  3 Aug 2023 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pU4Z0sRPnITfyNh8bmYy5dLZFhRTkYdbstpRICVQfIc=; b=QRlZw0qk70K3ko
	nOZnvszuDomnQ3gfki3Tie/NIGPyaE+MeEPznbgmrQormFd1pBqmuJAc+B5+0hsZ8Gczlu3RXwk9j
	xtt3WCvrZsWnFAIUI33dd4ZOVVW3sOrkrVvCRAeMUlicC/aflYPV6wyoLO/LQTsgIGqzK3/NI37wy
	OMDX8h4X337FUHvzXPXcH1QYnII8eCLKfhXaYBRRBYIZWBIvpZCNUbvQl8w9OkEbo7dRbKK0GaVv7
	TXHjVlXLkAONo03PGC1bPWEeUl/5nf3jzkwslNCt0Ath/oXlOmdCy8suD2rEdSjhy9oU5adUzNlkd
	HAJMDOCSysHR7BUN8Y3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRd6j-00Aalu-1i;
	Thu, 03 Aug 2023 18:31:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRd6g-00AalI-2D
	for ath11k@lists.infradead.org;
	Thu, 03 Aug 2023 18:31:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0404661E57
	for <ath11k@lists.infradead.org>; Thu,  3 Aug 2023 18:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EC9C433C8;
	Thu,  3 Aug 2023 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691087489;
	bh=mkGPjy+loIDmO8JmcO7/O86tOi7CGEUCjA4ltV55Hfs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Zgw6ELPJCZc7fbnwSBRJTI6ShjVQ9Hmtk1FN8xIh3E5JaSyTFDA1FkJ11SM9swqAy
	 wW86a77DkN81aTI3TMl9kNwhEcrSJuQkGZb2JnyBvTLWxNb/hdoOYYVEr7FA44ytfm
	 I3sQtwdK2x9DNbCI3m4GxoAjHJNf/oi39PKoRGANUkGNxKSqkw07qNpCe+e+1cIftG
	 xpbzz3L+8YX4YI2YQjUCvByBmTglM94V6sO/p5EMnJmRns+PjDLg7/34RUY/eT3jaH
	 R7B2mM54KguC06mgTcZ0e5AyQPqNe+7n709NEknyo5+vsrv2dHkBHWWxbpRhpfHSwL
	 EyBuvoNmTe75A==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/3] bus: mhi: host: allow MHI client drivers to
 provide the firmware via a pointer
References: <20230727100430.3603551-1-kvalo@kernel.org>
	<20230727100430.3603551-2-kvalo@kernel.org>
	<20230802110110.GD57374@thinkpad>
Date: Thu, 03 Aug 2023 21:31:51 +0300
In-Reply-To: <20230802110110.GD57374@thinkpad> (Manivannan Sadhasivam's
	message of "Wed, 2 Aug 2023 16:31:10 +0530")
Message-ID: <877cqcyo2w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_113130_779677_0C8AAFCE 
X-CRM114-Status: GOOD (  13.48  )
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

Manivannan Sadhasivam <mani@kernel.org> writes:

> On Thu, Jul 27, 2023 at 01:04:28PM +0300, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> Currently MHI loads the firmware image from the path provided by client
>> devices. ath11k needs to support firmware image embedded along with meta data
>> (named as firmware-2.bin). So allow the client driver to request the firmware
>> file from user space on it's own and provide the firmware image data and size
>> to MHI via a pointer struct mhi_controller::fw_data.
>> 
>> This is an optional feature, if fw_data is NULL MHI load the firmware using the
>> name from struct mhi_controller::fw_image string as before.
>> 
>> Tested with ath11k and WCN6855 hw2.0.
>> 
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>
> I can apply this for 6.6 and then you can merge ath11k changes for
> 6.7.

Yeah, to keep things simple please apply patch 1 for v6.6. Then I'll
apply patches 2-3 for v6.7 (after fixing Jeff's findings).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
