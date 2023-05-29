Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0264CC7EE29
	for <ath11k@archiver.kernel.org>; Mon, 29 May 2023 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/EchX+dBzpAOTDvHGtUaPHwhJPGi1HOm/RohU7Ebwo=; b=nxvdYX4aMY1Zr4
	sf15IJ+dbqRr79ESH95YcBCVYU3uvYwExo44ibuaK/+JEVEoApm37fjL/Ak//A3QbxwND9+b8k10u
	EQHpciVzh6tmGH+UNOkAtId/8v+hDJcE/5fEQz6Y2lyu+iIE9iyALs/pM0W0vCYX/EifKbrwC17EG
	l8TjmmhMqFtgvHuvMCBz7+gSAFLkdS0HXnSWRJzHNjyIEBI0CjG7RWuvOxTb7oDFombb8D/u1NWUG
	w/nF3vhokoEWze+NG5wIIFDN5sb54oIrmQn0KmC+LyAtiFquKY8lKk08TGYjOSi/qQuvkMvO1M7Yn
	jk1e3a3hXF0GsP2o38BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Ydm-009mFk-1d;
	Mon, 29 May 2023 08:54:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Ydg-009mEU-0T
	for ath11k@lists.infradead.org;
	Mon, 29 May 2023 08:54:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29519612D8;
	Mon, 29 May 2023 08:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9922AC4339B;
	Mon, 29 May 2023 08:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685350442;
	bh=yFQoDbvUZKYP4JLoEIA7FnYN2Ge8Oy7LN+ea+G62uSQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AITr/IMOjkW+VO6xNWU+UkmxItrOQAupHiqyWB2Zq9B1oK/XDwizemcQyaRvofPKg
	 8u3ETytUXcsd6uqUZ0Yzw+Tt59607gtdPubIhZ3dTr77mA0M7W5v4gsjfOoZpjb+xF
	 sL2HERxHZcjHFFN1QQKzY0ml9fF9MpygKKnIegDk7+k87yltppZSID2OAb6LKpHA9e
	 q8TZFLF8cCysqmlwKTH7MyQZvaFHUkbCpSj8Lk0r+12+3iZyQj91VTc5Q0qxwgdj7o
	 Y5X0KeMvtfllG8vASNJxUlyj9zMX6oCF/4zh+VlLPwsiseNKwWTdMFqpqfJyHw+AGE
	 3ywrMDCRzq9FQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mhi: allow MHI client drivers to provide the firmware via a pointer
References: <20230308152522.6728-1-kvalo@kernel.org>
	<20230308152522.6728-2-kvalo@kernel.org>
	<20230315081820.GD25575@thinkpad> <87353jl3it.fsf@kernel.org>
	<20230528145721.GE2814@thinkpad>
Date: Mon, 29 May 2023 11:53:57 +0300
In-Reply-To: <20230528145721.GE2814@thinkpad> (Manivannan Sadhasivam's message
	of "Sun, 28 May 2023 20:27:21 +0530")
Message-ID: <87pm6jjz6i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_015404_281474_0A877A53 
X-CRM114-Status: GOOD (  21.45  )
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

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Fri, May 26, 2023 at 02:45:46PM +0300, Kalle Valo wrote:
>
>> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>> 
>> > On Wed, Mar 08, 2023 at 05:25:20PM +0200, Kalle Valo wrote:
>> >> From: Kalle Valo <quic_kvalo@quicinc.com>
>> >> 
>> >
>> > Subject prefix should be: "bus: mhi: host: ..."
>> 
>> Will do.
>> 
>> >> @@ -392,9 +390,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>> >>  	const struct firmware *firmware = NULL;
>> >>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> >>  	const char *fw_name;
>> >> +	const u8 *fw_data;
>> >>  	void *buf;
>> >>  	dma_addr_t dma_addr;
>> >> -	size_t size;
>> >> +	size_t size, fw_sz;
>> >>  	int i, ret;
>> >>  
>> >>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>> >> @@ -424,6 +423,14 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>> >>  	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
>> >>  		mhi_cntrl->edl_image : mhi_cntrl->fw_image;
>> >>  
>> >
>> > Can you please add a comment here?
>> 
>> Ok.
>> 
>> >
>> >> +	if (!fw_name && mhi_cntrl->fbc_download &&
>> >> +	    mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
>> >> +		size = mhi_cntrl->sbl_size;
>> >
>> > Don't you need to validate sbl_size?
>> 
>> Good point, I'll add that.
>> 
>> >> --- a/include/linux/mhi.h
>> >> +++ b/include/linux/mhi.h
>> >> @@ -299,6 +299,10 @@ struct mhi_controller_config {
>> >>   * @iova_start: IOMMU starting address for data (required)
>> >>   * @iova_stop: IOMMU stop address for data (required)
>> >>   * @fw_image: Firmware image name for normal booting (optional)
>> >> + * @fw_data: Firmware image data content for normal booting, used only
>> >> + *           if fw_image is NULL (optional)
>> >> + * @fw_sz: Firmware image data size for normal booting, used only if fw_image
>> >> + *         is NULL and fbc_download is true (optional)
>> >>   * @edl_image: Firmware image name for emergency download mode (optional)
>> >>   * @rddm_size: RAM dump size that host should allocate for debugging purpose
>> >>   * @sbl_size: SBL image size downloaded through BHIe (optional)
>> >> @@ -384,6 +388,8 @@ struct mhi_controller {
>> >>  	dma_addr_t iova_start;
>> >>  	dma_addr_t iova_stop;
>> >>  	const char *fw_image;
>> >> +	const u8 *fw_data;
>> >> +	size_t fw_sz;
>> >
>> > Even though these members are not creating holes now, shuffling the datatypes
>> > will create holes in the future. So I always prefer to keep the struct members
>> > sorted in the below order:
>> >
>> > pointer
>> > struct/union
>> > u64
>> > u32
>> > u16
>> > u8
>> > bool
>> 
>> I'm not sure what are suggesting here as struct mhi_controller is not
>> using that style. Are you saying that fw_sz should be after reg_len? So
>> something like this:
>> 
>> 	const u8 *fw_data;
>> 	const char *edl_image;
>> 	size_t rddm_size;
>> 	size_t sbl_size;
>> 	size_t seg_len;
>> 	size_t reg_len;
>> 	size_t fw_sz;
>> 
>
> Ah, I thought I already sorted them up but apparently not. Keep it as it is,
> I'll sort this and other structs later.

Thanks, I'll then keep it as is and send v3 soon.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
