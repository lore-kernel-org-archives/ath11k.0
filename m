Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D38CC8303C
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 10:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njs/a9YmbrfSj8TquqSQGFpLy4CGvLcOR4JivFTYSx0=; b=HrNJtj2T29dpXyxXWnIhPfQeAQ
	t83X6axZhg+ZII213o+P2qmu0k84ON1nZ0UeCy3agJl+gU+pZJnHIica4XSL/j5YHJVxwpptr0z2t
	/gQK6jZjjqn5m56zglX3kPuu/1ClhSmSNo+YFMGkN888gR54TED9Do6sQVvQbj7iF0lzrTJiLz1Gr
	GHGAVi+dxt65tJc2TIbmmAAnPW37W8gZv782xFYaKSMl8V618tiqBF49cW9/o9EaiTfYRQENMUZqZ
	HbgKwBEOPcRVO5oKbJXfptZmW6vD7w23qWWUC2CqbO1apQCPaxA4OO5MN5mGGTR1McuFBMdunwWeX
	5ObsnUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5Fh-000000051Mb-184Y;
	Tue, 08 Jul 2025 10:08:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4vg-00000004viu-2PWr
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 09:48:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56881X4O027037
	for <ath11k@lists.infradead.org>; Tue, 8 Jul 2025 09:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njs/a9YmbrfSj8TquqSQGFpLy4CGvLcOR4JivFTYSx0=; b=iIUWvQKokSiVX8TB
	3rPi1zEiEhuAiEBDT0pmC0KkughyW6E13JZLbd/+VznBLC0EkLnLfiKqmdZCKCzO
	DvBVXnoEqTVv11A6wKupehF+UuTmkJ6Xc4ai9MrR9/73NxBzSHMQB3i7MJKP7oZV
	SqvpOFIItR4PUIJHCW494zdyWMoJjszqHoBaB7IIcF5g7X1S0BiDZXEjILKABz9H
	qtoclGmI8AB+9oeQNDkux/Rc54tKzoDSMbqTgWKuMbww/RBP34Eejxml0VxF4bXF
	Ybzs5r1GI5pDeiTr8CTbnx7Qu4GhZJ3CSCjDPK9VWx1e71BbUJcfs3fp2sAo0NKw
	MG3NFw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xvqu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 08 Jul 2025 09:47:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31f112c90aso2653595a12.0
        for <ath11k@lists.infradead.org>; Tue, 08 Jul 2025 02:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751968077; x=1752572877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njs/a9YmbrfSj8TquqSQGFpLy4CGvLcOR4JivFTYSx0=;
        b=jUqWa4GQnss9XvoCBRLvMQ1PGfpjtsPaDaN+Q25rp0/GUM9vmrEnp0pIxAM06grJYr
         w2SquVT4ZnQhmv6GlyrtDYckCwKRkgvlcide91rAY9am/5BuUH4dOv3am0jmOsjiDoTS
         VWl2KlVX7Ixvz2WP5ZpEnkldTl0F4sY1opZc3kvW84YWq6+63f7PG6rsFzcKMtHr4fAY
         MhTbtzd28PCH3aL0meubk0cd6vRe2DRnf5j4bIL597+cKK7L4++RJQKRsceycJfmLmhB
         HRpU6Qnpi7uapQdUTmpqn881YjB3hE6DNnweVlvnuEHi6vJlckptaQKHQHLxjWj5DYFY
         BlBA==
X-Forwarded-Encrypted: i=1; AJvYcCVlY8vFW9qFbBurTv/ua5J8IuohHZHzP4ai7bdbzsT5YL2b8IJ6En20yXyGRcplXx0wxTwlxz0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLFbGXHGX7VtBZiHMkWZXsk0QHr9A9jzc88xpy7buRLLeiIRne
	z8tkcPQlcRwGUnq9yLBlmViDxxWbCILklyjqUzDLRYt3sAr5SZI0MHgnkE4CA65Ci6AX4PTdOEI
	sxeOvYDOXqa5dh75Eb9aXRUTbjfQHWS0yzMaAs5mqTEdw21TY2JpUTRcy1Kv9Na4M
X-Gm-Gg: ASbGncspGqtHVt2uvVyXjhrwzdp8tZJAGo+ItfEQWeOb8QSQie6Ezj0bYknVDolp0qB
	9t2fUxQdt1Z6NAd3khPMBGxgBpdfT20L6hCOuAnLP1IhZ+mrV/9mqxz47ORFgZyqNAO6Sm/Zj85
	Hu+sgyCORTnJLBy/dIrR+SonwpC53PfXP89SMhxR5k6o5WwtUnCTvo7+PIL4HlgaQyR9SZ+mdxy
	X2kMP0b/ilNWISyqI0DTJjsrcko+i2WH3Wfc5lP+vxGniqtn+mDuUnk38tPAwIRVVWPSWLkxahU
	V308i4tBJuiW51+EuVVI0RvfmNrhibA1VSdje0U0WB6znfKZ14WC
X-Received: by 2002:a17:903:2c5:b0:235:e94b:62dd with SMTP id d9443c01a7336-23dd1b2834bmr33312315ad.12.1751968077188;
        Tue, 08 Jul 2025 02:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqQCn0zBoj5m+uABIv+hHMtgAY7o4x29kvnu/P7PJA1PO0G36QZYi2DbfeTjQzqaz+bQRXqA==
X-Received: by 2002:a17:903:2c5:b0:235:e94b:62dd with SMTP id d9443c01a7336-23dd1b2834bmr33312085ad.12.1751968076664;
        Tue, 08 Jul 2025 02:47:56 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455cf60sm104858925ad.98.2025.07.08.02.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 02:47:56 -0700 (PDT)
Message-ID: <b76cfe82-b977-4166-85d8-368539b392fd@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:17:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] bus: mhi: host: keep bhi buffer through suspend cycle
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-2-usama.anjum@collabora.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250630074330.253867-2-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4MCBTYWx0ZWRfXyU4BAA62HZSD
 Uu64GlDXrtjr+gJD+BlMRHuMBptCOYvzqe4qK3WiesBQTU2uT8Xac55ShEASo6mTgnytHiLtW25
 n88x/BncjE6HqcypN7lzchQZoZETb3ExCK02LhImEuJU1CkAXKAdgx2my3Hqr06B22xd/JMn35b
 ThWnmkJ4O13wAaMXFof0JK3ZONipgpVmDTnFLZ8n8q+MQPntyGCUOSSCGNMCPWJEL4wO7h8uj3Q
 1TcvesE2jEmpRZyNTRLcI9AgMicR+MhC1R9T/wK5tTus0cBabEuJZMhGzphQ511NgcacN0Z2MZB
 jkwGyf9wybMq5a6LPoAlTC1c2uN1mG3Pwdcxi/OZ0Yx/VGf0d1aNnvQDbEXDDG1kvmRnXb8QNaT
 dzxOn9awQCBqKB5ngXuBG7f0uavHJt2sKI6AP0r+jOWPO/78aiqOuLR/Nlzn9pA3WQF8n47m
X-Proofpoint-ORIG-GUID: aBf7OpjDsbmMeS1vvg66mXF6UkKxrJZL
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686ce94e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8
 a=B232akhBMsyPXTXv-t0A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: aBf7OpjDsbmMeS1vvg66mXF6UkKxrJZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_024800_760146_CD344CC3 
X-CRM114-Status: GOOD (  29.20  )
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



On 6/30/2025 1:13 PM, Muhammad Usama Anjum wrote:
> When there is memory pressure, at resume time dma_alloc_coherent()
> returns error which in turn fails the loading of firmware and hence
> the driver crashes:
> 
why only bhi? bhie can also have same issue.
> kernel: kworker/u33:5: page allocation failure: order:7,
> mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> kernel: CPU: 1 UID: 0 PID: 7693 Comm: kworker/u33:5 Not tainted
> 6.11.11-valve17-1-neptune-611-g027868a0ac03 #1
> 3843143b92e9da0fa2d3d5f21f51beaed15c7d59
> kernel: Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> kernel: Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
> kernel: Call Trace:
> kernel:  <TASK>
> kernel:  dump_stack_lvl+0x4e/0x70
> kernel:  warn_alloc+0x164/0x190
> kernel:  ? srso_return_thunk+0x5/0x5f
> kernel:  ? __alloc_pages_direct_compact+0xaf/0x360
> kernel:  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
> kernel:  __alloc_pages_noprof+0x321/0x350
> kernel:  __dma_direct_alloc_pages.isra.0+0x14a/0x290
> kernel:  dma_direct_alloc+0x70/0x270
> kernel:  mhi_fw_load_handler+0x126/0x340 [mhi
> a96cb91daba500cc77f86bad60c1f332dc3babdf]
> kernel:  mhi_pm_st_worker+0x5e8/0xac0 [mhi
> a96cb91daba500cc77f86bad60c1f332dc3babdf]
> kernel:  ? srso_return_thunk+0x5/0x5f
> kernel:  process_one_work+0x17e/0x330
> kernel:  worker_thread+0x2ce/0x3f0
> kernel:  ? __pfx_worker_thread+0x10/0x10
> kernel:  kthread+0xd2/0x100
> kernel:  ? __pfx_kthread+0x10/0x10
> kernel:  ret_from_fork+0x34/0x50
> kernel:  ? __pfx_kthread+0x10/0x10
> kernel:  ret_from_fork_asm+0x1a/0x30
> kernel:  </TASK>
> kernel: Mem-Info:
> kernel: active_anon:513809 inactive_anon:152 isolated_anon:0
>      active_file:359315 inactive_file:2487001 isolated_file:0
>      unevictable:637 dirty:19 writeback:0
>      slab_reclaimable:160391 slab_unreclaimable:39729
>      mapped:175836 shmem:51039 pagetables:4415
>      sec_pagetables:0 bounce:0
>      kernel_misc_reclaimable:0
>      free:125666 free_pcp:0 free_cma:0
> 
> In above example, if we sum all the consumed memory, it comes out
> to be 15.5GB and free memory is ~ 500MB from a total of 16GB RAM.
> Even though memory is present. But all of the dma memory has been
> exhausted or fragmented.
> 
> Fix it by allocating it only once and then reuse the same allocated
> memory. As we'll allocate this memory only once, this memory will stay
> allocated.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: cd457afb1667 ("bus: mhi: core: Add support for downloading firmware over BHIe")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Reported here:
> https://lore.kernel.org/all/ead32f5b-730a-4b81-b38f-93d822f990c6@collabora.com
> 
> Still a lot of more fixes are required. Hence, I'm not adding closes tag.
> ---
>   drivers/bus/mhi/host/boot.c     | 19 ++++++++++---------
>   drivers/bus/mhi/host/init.c     |  5 +++++
>   drivers/bus/mhi/host/internal.h |  2 ++
>   include/linux/mhi.h             |  1 +
>   4 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index b3a85aa3c4768..11bb8c12ac597 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -302,8 +302,8 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
>   	return -EIO;
>   }
>   
> -static void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
> -				struct image_info *image_info)
> +void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +			 struct image_info *image_info)
>   {
>   	struct mhi_buf *mhi_buf = image_info->mhi_buf;
>   
> @@ -455,18 +455,19 @@ static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *m
>   
>   static int mhi_load_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
>   {
> -	struct image_info *image;
> +	struct image_info *image = mhi_cntrl->bhi_image;
>   	int ret;
>   
> -	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> -	if (ret)
> -		return ret;
> +	if (!image) {
> +		ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +		if (ret)
> +			return ret;
>   
> -	/* Load the firmware into BHI vec table */
> -	memcpy(image->mhi_buf->buf, fw_data, size);
> +		/* Load the firmware into BHI vec table */
> +		memcpy(image->mhi_buf->buf, fw_data, size);
> +	}
>   
>   	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
if mhi fw load fails didn't we need to free bhi buffer.

- Krishna Chaitanya.
> -	mhi_free_bhi_buffer(mhi_cntrl, image);
>   
>   	return ret;
>   }
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 6e06e4efec765..2e0f18c939e68 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1228,6 +1228,11 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>   		mhi_cntrl->rddm_image = NULL;
>   	}
>   
> +	if (mhi_cntrl->bhi_image) {
> +		mhi_free_bhi_buffer(mhi_cntrl, mhi_cntrl->bhi_image);
> +		mhi_cntrl->bhi_image = NULL;
> +	}
> +
>   	mhi_deinit_dev_ctxt(mhi_cntrl);
>   }
>   EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 1054e67bb450d..60b0699323375 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -324,6 +324,8 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>   			 struct image_info **image_info, size_t alloc_size);
>   void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>   			 struct image_info *image_info);
> +void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +			 struct image_info *image_info);
>   
>   /* Power management APIs */
>   enum mhi_pm_state __must_check mhi_tryset_pm_state(
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 4c567907933a5..593012f779d97 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -391,6 +391,7 @@ struct mhi_controller {
>   	size_t reg_len;
>   	struct image_info *fbc_image;
>   	struct image_info *rddm_image;
> +	struct image_info *bhi_image;
>   	struct mhi_chan *mhi_chan;
>   	struct list_head lpm_chans;
>   	int *irq;

