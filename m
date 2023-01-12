Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9C6C54EBD
	for <ath11k@archiver.kernel.org>; Thu, 12 Jan 2023 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrH+PKUee3SR5IyOs1c8djSLsmR3beZ4w2udRg97m9c=; b=Sm5Y5/le2rOVu5
	5df11DstzkmlERGHeKureeZSBS6jVrwo7orUZXvpuWm99jLm90yDCuVvMzzKQR59nKkEp4upULSwL
	TAtlCnM/Qqyj+qIMx0LJMlkWNEJLwKtDNSOn3I5J7agGVoeb7eXY6MndmBXcP/2NCimodrq7UwiXh
	OUDenGcJhZV6+dCSHbotPYpx2CiP5g2KQFnR4cuDCMppgv/R5fXIFL6ehrhdIcTCWMJDnfIsiRVp5
	kYetOcmOfS1P1IirFTfSJVvL/hDDA5O12clUDZKtIYp9DjW8gqpEKSVnujsFVk1UjtG29cXrLfaO4
	zmOunmMRfUHfFsuWuCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtkK-00EKyE-1p; Thu, 12 Jan 2023 09:19:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtk6-00EKsd-QJ
	for ath11k@lists.infradead.org; Thu, 12 Jan 2023 09:19:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 882EAB81D90;
	Thu, 12 Jan 2023 09:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53958C433F0;
	Thu, 12 Jan 2023 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673515164;
	bh=HYOhnv+T+iftwKLs538Ljw0Pj6fCRNz21LxLxNvbQcA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LoHoi02IfYVHDYDXF2YLK3ow7L3x8tp5xd96iP74uYzMabaZ98minm6khDeaVXUeH
	 NkACXi0UMzJYufaMN6vK8po4PEsPgUsggd9C+y1IQy7J911Mm5J+VtFUjRrHHyZCKG
	 Kad+uqgcNT/gZ/blvigyro3qf7C7Lg1buT4DAIkwrwyZuEJR3CQUhQUMUO6ZtabW7O
	 YG+PUsFfUfYq4bZhTERISpr1FtaRjl1TjPjJr+AWG9pGE3lGmLPG08+Da44n/Qi9Dn
	 BRNrOJoQ2wVXbh6Ffsk6D2MOPK2G3N3jdoHX2whipZCgYR9sA3/uHDMTUQLBXDlS27
	 Lmpl8TIBuUx6A==
From: Kalle Valo <kvalo@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: <mhi@lists.linux.dev>,  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] mhi: allow MHI client drivers to provide the firmware via a pointer
References: <20230111092547.21425-1-kvalo@kernel.org>
	<20230111092547.21425-2-kvalo@kernel.org>
	<7d692402-3fc1-3b4c-9697-25e722e94539@quicinc.com>
Date: Thu, 12 Jan 2023 11:19:21 +0200
In-Reply-To: <7d692402-3fc1-3b4c-9697-25e722e94539@quicinc.com> (Jeffrey
	Hugo's message of "Wed, 11 Jan 2023 08:20:34 -0700")
Message-ID: <87bkn4ds9y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_011927_071354_0B061E9B 
X-CRM114-Status: GOOD (  20.72  )
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

Jeffrey Hugo <quic_jhugo@quicinc.com> writes:

> On 1/11/2023 2:25 AM, Kalle Valo wrote:
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

[...]

>> @@ -478,14 +489,14 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>>   	 */
>>   	if (mhi_cntrl->fbc_download) {
>>   		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>> -					   firmware->size);
>> +					   fw_sz);
>
> Minor nit, but it seems like this could be all on one line.

Will fix in v2.

>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -299,6 +299,10 @@ struct mhi_controller_config {
>>    * @iova_start: IOMMU starting address for data (required)
>>    * @iova_stop: IOMMU stop address for data (required)
>>    * @fw_image: Firmware image name for normal booting (optional)
>> + * @fw_data: Firmware image data content for normal booting, used only
>> + *           if fw_image is NULL (optional)
>
> The implementation requires fbc_download to be set, which is not a
> requirement for fw_image.  That is not apparent here.

Ah, I had missed that. Will mention that in v2.

>> @@ -384,6 +388,8 @@ struct mhi_controller {
>>   	dma_addr_t iova_start;
>>   	dma_addr_t iova_stop;
>>   	const char *fw_image;
>> +	const u8 *fw_data;
>> +	size_t fw_sz;
>
> Did you run pahole?  I remember this struct being well packed, and I
> think this will add a compiler hole but I have not actually verified.

I actually haven't used pahole for ages. I will run it and check how
this structure is packed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
