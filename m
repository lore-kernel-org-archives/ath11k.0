Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E67CC0015E
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eU9ib+CkWwHaxtuxGFJOlKPI1zm4EqlsNOr6tr+624k=; b=DXEV34fYAZ8M+z
	+qf5na5SAy6WVIgMt2oeA0ZgZoajClcDUudZZN4/SzEeubbwynKqda1whaeOy3QnvpHB8WMtxYl06
	z3387e4q4mX1z9RSd8eeiM21egRpL2fc5MyHuPHIM8SDWklNleqZH2RgbbnlwQkNexuxQFvqilXyC
	bSe5UQZpiyU9WlFY5uGz4tqDHlOpKHDYnsCJJa6UHuk9UNNzGLnyxMBtSXqD4s1dsl9d8uVsYETIw
	Jv98X7mTJRksd5/Wk1Vj9b9XKoRfV3iD6zGtrDIfIHi22HzSWdwa0e9uGBITlQTURU+jfLHZLt3Ox
	WChZEqw2VagREyKHnEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxuJ-00CvwL-06;
	Thu, 27 Jul 2023 10:07:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxuG-00Cvvx-1L
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 10:07:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5DEB61DEA;
	Thu, 27 Jul 2023 10:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D641C433C8;
	Thu, 27 Jul 2023 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690452459;
	bh=4B7J3DgvOBHGo6p3m1Nd1vpZc8QRGoaL/MdCOq/oGho=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YwNloGl6NwR7YLPFl1+21K5endW0UBtm/9XPXImzx/v5aBkoHS0KfYT1dBLhARGGd
	 o0k6NDeaRhzm6jexbkg7CBtTz8FssBkMl/3mZC6z6+OpR2g1iQAXOuEyPrwzhH07qp
	 5odZrJJ3eVR0M6iVH6yA3NwauvI70+hHoeMH3zEsOUMOM7/WJ1aVjbyKJITpFwCf2F
	 /xF2A1OQCTBRJ42N4ax40vF6mv3G9pRKGZ26b46++NcWBe+PrzpW0GBPy2mF96P/P/
	 Mw26MohcRDPUyudVtYEMZheDhRv/pKWf6FbttuyF724jjupxn0qEpZpkKhe0iotC0h
	 xPkof6Yq2nabA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: <mhi@lists.linux.dev>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] bus: mhi: host: allow MHI client drivers to
 provide the firmware via a pointer
References: <20230530141813.29333-1-kvalo@kernel.org>
	<20230530141813.29333-2-kvalo@kernel.org>
	<6494e9f5-a4df-c058-49bb-1ebfeca5a91d@quicinc.com>
Date: Thu, 27 Jul 2023 13:07:36 +0300
In-Reply-To: <6494e9f5-a4df-c058-49bb-1ebfeca5a91d@quicinc.com> (Jeffrey
	Hugo's message of "Fri, 2 Jun 2023 11:17:22 -0600")
Message-ID: <877cql1xcn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_030740_494863_8BDCEDE7 
X-CRM114-Status: GOOD (  12.33  )
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

>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -299,6 +299,10 @@ struct mhi_controller_config {
>>    * @iova_start: IOMMU starting address for data (required)
>>    * @iova_stop: IOMMU stop address for data (required)
>>    * @fw_image: Firmware image name for normal booting (optional)
>> + * @fw_data: Firmware image data content for normal booting, used only
>> + *           if fw_image is NULL (optional)
>
> It looks like your implementation requires fbc_download to be set, and
> while you mention that for fw_sz, you don't mention it here.  While I
> think this would be useful for non-fbc usecases, we don't have that
> use currently.

Thanks for the review. I submitted v4 to fix this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
