Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAE0C3ABCB
	for <ath11k@archiver.kernel.org>; Mon, 12 May 2025 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=; b=lYAPLuAW7rjbfOkepGOKDPzMRB
	Uc+cRcE7eg9C2UtNEPbCfDPR/Fa2DEi2Eg7EjNvsNjxcSQCMAFIHYI3TtLJd0/d1RrxlSecGerH49
	22nawEVyB2QcHZh4ZYS/nhW5d7/ll7rbN1+kviQA48W8oG1Juf2vUhIQeHjEPbgL2VUS3K9hZB7HF
	/itQ9MF0BLdl0jp5GC/MpHKKQfPQQUUAd58I59cldJLZz3G3q5Dw3rT0/UFfNfqAckrQdOXpAflY7
	p1BBYKOO3N3XubjAQQhUe90Zmp9l7V2wifFvP+Ra/4T9Tt3YmdJU//ztX80LZn49uOyamY+TAMcRI
	Nfjml6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYM4-0000000ATCh-2muO;
	Mon, 12 May 2025 18:58:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYAx-0000000AS3o-2bdz
	for ath11k@lists.infradead.org;
	Mon, 12 May 2025 18:46:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CHPG8H023765
	for <ath11k@lists.infradead.org>; Mon, 12 May 2025 18:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=; b=W0l+3+APuqQo0LFX
	g236I3NUxXGKMXbpA9Ke8JlmNzDqNPDyW4VzT/UwxtmB7CTbs6741vrCtp3yQhxv
	LE3WZP5kQs2r/ac/oIMXrwbK8yZqcKruQ0t5vn32fCUeGvoPyVAGhNxk0dWJJ1UU
	RWjxbP/p/7x8udGOocwqsc+TUG+5tcNpSSQJjcI/Z2mlLNLKMp+0AZ2bxsGgHCr5
	v9gT2V+ETI9JA/WGD4qw3d86DbfmQicXYFccIp/6wsOBKLbynlBxgfI2QOT7Rwz6
	x3foFKY+dql18044P/cwdSvDVc+13ffx1rPJUwChZaXZ4Iw2xmX6pFB/vfJAMgw2
	Q8wYWw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp1j6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 12 May 2025 18:46:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b00e4358a34so2816721a12.0
        for <ath11k@lists.infradead.org>; Mon, 12 May 2025 11:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075613; x=1747680413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=;
        b=tDLgb1UICDEceANNEnWhm5FZ3yCElGTtilYTNLvGSNIv2GBq7EI0A74MLtAOmOCZ+r
         gFwniiVrcNdlkEmDrPMVZRZvRoXfATULAI4S3R7nhdyTHjzO1Cq+XNByJO9dWN9UbXp8
         D3MnUcolQXjD0naB0VA1qH8B6nUZjPRyCkhhf06KRxuB938IEWJs8LydYaq4jKR2V9QF
         2e7snfC0onl8RpUUF3Z7Ryr1BxXu8/gZRf9rZ8NwbFrD2fYI0mGdaYBG4UJ/McduDOLx
         JleaZp9MQ6irtAKQYe2bPQkzJRqZIXmmTmfqpcGqXXwxxPa/jmXEsdMfVhiNyIZYIM15
         f1yw==
X-Forwarded-Encrypted: i=1; AJvYcCXab8lWyIC0QtR/rw57aekvfI2au5UTJhZT7rBuPr3MFgQcecaD51oShACm1xtwLVBZ9BNYWkE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3LRsCGNfkvxqqFolTL3NVxQZ6Z8vYaAeDEIRcd7k2nXJI15ht
	AONKyn8CrDdwUhQ4JyaNr97lvYiCSal4O0Ta0tTQvhbI9KI4+39hDYKITXibB2R1ZAxpNIkPHUX
	ER8XCzZo4DIo4CbDubaHENMkH3iERODQyYFj4NRVucqFrA7NPX+DsOUXnJ757
X-Gm-Gg: ASbGncuumRB1xd+u5o6NAQOMqts4j2YKCH9UTJwExAJ+QqT4MaVGE5H/WC5wvAe6Jb5
	Gl73iw3M/oEzMKzH7hhFvltW0i2Tl71ZejarH2OiiI3x3YP+sgyTWDysMAc+g91yP/cs/6C0D+u
	S2XIUtrmUGgmpQTZN3i/rr94GRe6YvFuN7RBHFMd4E5mGpue4D7gD/B7IKpkJkdSa9JQKjOnW9V
	4vqGy/TRkGWUrYUIzkFPDCmk7o7m4FMHdkKLrhUHZo3Y7nvFQ1enSSM8M7DybIZyv3hYR70ajgd
	dTIjeUxPSLZNPWUKfMjlox+HKjb0gF/Eaus960K0JIf1gR3HnEy02y9Dpq9sNQ==
X-Received: by 2002:a17:902:ce86:b0:223:39ae:a98 with SMTP id d9443c01a7336-22fc8b56fdfmr213280685ad.22.1747075613193;
        Mon, 12 May 2025 11:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsWqOd3L30u9cjxgIPmURHi+KkJtpXwBIuouO1S+U1W3n2h4To43nTOBZ4I/fyhCvVNGYpGg==
X-Received: by 2002:a17:902:ce86:b0:223:39ae:a98 with SMTP id d9443c01a7336-22fc8b56fdfmr213280045ad.22.1747075612588;
        Mon, 12 May 2025 11:46:52 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544f5esm66669185ad.36.2025.05.12.11.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:46:52 -0700 (PDT)
Message-ID: <4a6b83f4-885a-46e1-ae31-21a4f3959bae@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:46:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _052VNYetb0oapfp4xv1nDOoHZhPRp0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MyBTYWx0ZWRfX4yyXLHbSaNNe
 JgWQx8JBz2HcglIkMhqITn4+PC9H9lNoCBWOU5CGCQ0FqiQioipuy2sz5wjIPnHkvQ5PPiAKIYW
 G4Q6o1/TygHGSPi0JNfrw6jUSIEYRZrRZD6FJv5I863x9vJIfs5FTRv5HYgVUGEKTlIHZDpOjKk
 cpwhaX0yGBOxHOSHX4mhVvERN7t1qQT2XpC47CfqX47DG7o1ExG3ag+H15/MB7/fz1m4BmUqN98
 RFVtk7KD/29Hhq31Xlnwew09IPl6Wqv74KzAa1GIIrIPOX/uokqvxTiXGkWrLAY6LDkqKoZbksg
 8ZSVysBnZsp/Vs8s4UyFXH4P9w/8AcnwucSn0XZSFEHHFvDDhcFxjuMz8qrbzTXVJnUUFCyyXKM
 XGRqkZ8lOaHlbuB7SNUNKkzleo1zzyAPxhICyRFY5sJAJij7rUSQLh/MJBeMD4E/Mlq49jqS
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=6822421e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=mx74GWaVK5euFb1038QA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: _052VNYetb0oapfp4xv1nDOoHZhPRp0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_114655_770974_AD59E85F 
X-CRM114-Status: GOOD (  21.86  )
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

On 5/6/2025 8:49 AM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.

Why is it valid to load new firmware as a result of suspend?  I don't 
users would expect that.

> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d2..bc8459798bbee 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -584,10 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	 * device transitioning into MHI READY state
>   	 */
>   	if (fw_load_type == MHI_FW_LOAD_FBC) {

Why is this FBC specific?

> -		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> -		if (ret) {
> -			release_firmware(firmware);
> -			goto error_fw_load;
> +		if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
> +			mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
> +			mhi_cntrl->fbc_image = NULL;
> +		}
> +		if (!mhi_cntrl->fbc_image) {
> +			ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> +			if (ret) {
> +				release_firmware(firmware);
> +				goto error_fw_load;
> +			}
> +			mhi_cntrl->prev_fw_sz = fw_sz;
>   		}
>   
>   		/* Load the firmware into BHIE vec table */
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index e6c3ff62bab1d..107d71b4cc51a 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -1259,10 +1259,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>   }
>   EXPORT_SYMBOL_GPL(mhi_power_down);
>   
> +static void __mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
> +{
> +	mhi_cntrl->bhi = NULL;
> +	mhi_cntrl->bhie = NULL;

Why?

> +
> +	mhi_deinit_dev_ctxt(mhi_cntrl);
> +}

