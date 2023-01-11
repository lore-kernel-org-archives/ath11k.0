Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E82C46467
	for <ath11k@archiver.kernel.org>; Wed, 11 Jan 2023 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m19cF/DMNJs0srSCFLAcNwV6bjFiuJyf4vyzR6K8y2s=; b=XJEc8/kxCmsQRL
	ca+IDt27N8tmXseUELKgx2oLh7jW+V9aDsDsLM6tLGt5O4nWqVIn0mog4dwUDuP8hrXjaXnY9z2Ch
	ElxdS7Aac6GtVwWssTfjQXU1OuXZuqrIBVSez2rASEoW8CZuzywhteWHNYIzfiDXc9MG7iKWoybZT
	dv/V5cdyVWBXo1f6BBjKOXC3S+64HdkRaVnRqHdvmcJN+/WhiISmC2MorXprnI25BO0bVf/z6aSEI
	9aimMq/4J6OH+2c0Hmo6jc8aqNhwbWueivqZ0cqeL1oUnkTXtF3IB6c9Qf0HCjIPnjTQ0LkCTtxk7
	re4D6dhO8Gy2yh6eGc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcuB-00ByNr-Jd; Wed, 11 Jan 2023 15:20:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcu8-00ByN7-P5
	for ath11k@lists.infradead.org; Wed, 11 Jan 2023 15:20:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30BDSZxW009906;
	Wed, 11 Jan 2023 15:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/YvBClGX/zmnvgpUhJlAbnaIFEHh8kuj/QmimjZlJVQ=;
 b=inIFMVHoHpNTCEfh/wxSElz80IpwzPvExgVeHgU8tTolg92Ar0hGjGlPVoI+bjOzFhV+
 PnDABswuvCIlrCqa8bQ3T9UHiUCU7dX2mvspo6q8PAB85abjocjFVhXb5gWuZnzx8GnE
 SELtV1D19p93ecyzidUdt3iUaQb8a8afGuw8XOYG3AePP8GqM5kfmxxfChOzSRQmkJzI
 5oTAhrz0xeNSjsYqc4sS1uqSNUtBWVzZdW0X+RkKQW0UE8q65CKcZ4hfxj+P/BlFnVcJ
 SCSzwqIvX8AgL0Aw2j6D57LT1c6kAlKWb2VJAghY54dJFW7iuZ9NRd3WT5wVluMIbGCc 3A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1k9j1kct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jan 2023 15:20:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30BFKa4c006670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jan 2023 15:20:36 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 07:20:35 -0800
Message-ID: <7d692402-3fc1-3b4c-9697-25e722e94539@quicinc.com>
Date: Wed, 11 Jan 2023 08:20:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/3] mhi: allow MHI client drivers to provide the firmware
 via a pointer
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230111092547.21425-1-kvalo@kernel.org>
 <20230111092547.21425-2-kvalo@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230111092547.21425-2-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bLQ0-FWqS3L6vY3jUhzMrUFMm8iU8d26
X-Proofpoint-ORIG-GUID: bLQ0-FWqS3L6vY3jUhzMrUFMm8iU8d26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_07,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301110112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_072040_852262_4B4BF69E 
X-CRM114-Status: GOOD (  32.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 1/11/2023 2:25 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Currently MHI loads the firmware image from the path provided by client
> devices. ath11k needs to support firmware image embedded along with meta data
> (named as firmware-2.bin). So allow the client driver to request the firmware
> file from user space on it's own and provide the firmware image data and size
> to MHI via a pointer struct mhi_controller::fw_data.
> 
> This is an optional feature, if fw_data is NULL MHI load the firmware using the
> name from struct mhi_controller::fw_image string as before.
> 
> Tested with ath11k and WCN6855 hw2.0.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/bus/mhi/host/boot.c | 27 +++++++++++++++++++--------
>   include/linux/mhi.h         |  6 ++++++
>   2 files changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 1c69feee1703..d6d5f424491e 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -365,12 +365,10 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>   }
>   
>   static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
> -			      const struct firmware *firmware,
> +			      const u8 *buf, size_t remainder,
>   			      struct image_info *img_info)
>   {
> -	size_t remainder = firmware->size;
>   	size_t to_cpy;
> -	const u8 *buf = firmware->data;
>   	struct mhi_buf *mhi_buf = img_info->mhi_buf;
>   	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
>   
> @@ -392,9 +390,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	const struct firmware *firmware = NULL;
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>   	const char *fw_name;
> +	const u8 *fw_data;
>   	void *buf;
>   	dma_addr_t dma_addr;
> -	size_t size;
> +	size_t size, fw_sz;
>   	int i, ret;
>   
>   	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
> @@ -424,6 +423,14 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
>   		mhi_cntrl->edl_image : mhi_cntrl->fw_image;
>   
> +	if (!fw_name && mhi_cntrl->fbc_download &&
> +	    mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
> +		size = mhi_cntrl->sbl_size;
> +		fw_data = mhi_cntrl->fw_data;
> +		fw_sz = mhi_cntrl->fw_sz;
> +		goto skip_req_fw;
> +	}
> +
>   	if (!fw_name || (mhi_cntrl->fbc_download && (!mhi_cntrl->sbl_size ||
>   						     !mhi_cntrl->seg_len))) {
>   		dev_err(dev,
> @@ -443,6 +450,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	if (size > firmware->size)
>   		size = firmware->size;
>   
> +	fw_data = firmware->data;
> +	fw_sz = firmware->size;
> +
> +skip_req_fw:
>   	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
>   				 GFP_KERNEL);
>   	if (!buf) {
> @@ -451,7 +462,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	}
>   
>   	/* Download image using BHI */
> -	memcpy(buf, firmware->data, size);
> +	memcpy(buf, fw_data, size);
>   	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
>   	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
>   
> @@ -463,7 +474,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	}
>   
>   	/* Wait for ready since EDL image was loaded */
> -	if (fw_name == mhi_cntrl->edl_image) {
> +	if (fw_name && fw_name == mhi_cntrl->edl_image) {
>   		release_firmware(firmware);
>   		goto fw_load_ready_state;
>   	}
> @@ -478,14 +489,14 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	 */
>   	if (mhi_cntrl->fbc_download) {
>   		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
> -					   firmware->size);
> +					   fw_sz);

Minor nit, but it seems like this could be all on one line.

>   		if (ret) {
>   			release_firmware(firmware);
>   			goto error_fw_load;
>   		}
>   
>   		/* Load the firmware into BHIE vec table */
> -		mhi_firmware_copy(mhi_cntrl, firmware, mhi_cntrl->fbc_image);
> +		mhi_firmware_copy(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
>   	}
>   
>   	release_firmware(firmware);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index a5441ad33c74..0d11fe22633e 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -299,6 +299,10 @@ struct mhi_controller_config {
>    * @iova_start: IOMMU starting address for data (required)
>    * @iova_stop: IOMMU stop address for data (required)
>    * @fw_image: Firmware image name for normal booting (optional)
> + * @fw_data: Firmware image data content for normal booting, used only
> + *           if fw_image is NULL (optional)

The implementation requires fbc_download to be set, which is not a 
requirement for fw_image.  That is not apparent here.

> + * @fw_sz: Firmware image data size for normal booting, used only if fw_image
> + *         is NULL (optional)
>    * @edl_image: Firmware image name for emergency download mode (optional)
>    * @rddm_size: RAM dump size that host should allocate for debugging purpose
>    * @sbl_size: SBL image size downloaded through BHIe (optional)
> @@ -384,6 +388,8 @@ struct mhi_controller {
>   	dma_addr_t iova_start;
>   	dma_addr_t iova_stop;
>   	const char *fw_image;
> +	const u8 *fw_data;
> +	size_t fw_sz;

Did you run pahole?  I remember this struct being well packed, and I 
think this will add a compiler hole but I have not actually verified.

>   	const char *edl_image;
>   	size_t rddm_size;
>   	size_t sbl_size;


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
