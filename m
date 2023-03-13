Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53714C61DA4
	for <ath11k@archiver.kernel.org>; Mon, 13 Mar 2023 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9cwODCBn8+kZtel5rJhpyTZ/R0tEi0JTw6x4zSSrG+Q=; b=tA7hVR/FUcodon
	gOTpyldVI3loey47qD+xK72bW83dV3h4JS9JB4KKJKK9QlQyCH4HODp7HwLlbqyz4CL59nUpujKY0
	cFfoli+76Oqx+Jemo4fGMqeOksmRPLLSE/LfAsuP5kRvcPEfm8+JOMIg5Ls1rl4hNlgMPnrUR1ucD
	IGT/z4ieKTsVTRdEOflfwkr8cRjlQqVyaeFxpw4mFDpRECYriy+/KuXwY+96kTJx82/nWZKL8b5fB
	cg2frroAWjXJC3gcDAOQUyjYmQku7XjE6SmCkjPCk0pp0cFDft4I5nVRKxWpjR8wq6p5rz8Jw9R5R
	k09bypBva5hvdndNOSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbinF-0064c8-4J; Mon, 13 Mar 2023 14:04:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbinA-0064Yj-2u
	for ath11k@lists.infradead.org; Mon, 13 Mar 2023 14:04:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DCm5pC008079;
	Mon, 13 Mar 2023 14:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mcKRsI6pbjp8EN5nqL+p9o0tf6nZAK32B/3a5SquJHM=;
 b=CjRPjuYYehS7T4tevupF5Ha8SHA2sFSO/CL8jKL6PFNebf1pQrj+BSkD5OXovliNT+2C
 1iOMO8SFecfDKTYkyVN/CKM7rq0Dx+iALQAuB2ReQonPKzWpj07gCNYCxwbKgGHoKlo0
 K5Hsib4smOO2Dm0w9qocz+OHjUZLtKoykIvNlPiropZwiFZAOJVJuiCW44mGtLsd4aRN
 UND+FRV6dbEhrolg5Q3njGwkr5WK0ukkaqQ372HV6E5/Xsjrj98USNppxIU8NTgTntp+
 1BhfhpWg8/A2ExvMxLf6Wu0QV3Jg2x95RwKdbp9UUlYtjdsWc8E+n4yu7G95+nG7fhCf 6Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pa44br7fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 14:04:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32DE4eIM015358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 14:04:40 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 07:04:39 -0700
Message-ID: <e1b72b60-cefb-a4b1-2784-9e72df71060e@quicinc.com>
Date: Mon, 13 Mar 2023 08:04:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/3] mhi: allow MHI client drivers to provide the firmware
 via a pointer
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <mhi@lists.linux.dev>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20230111092547.21425-1-kvalo@kernel.org>
 <20230111092547.21425-2-kvalo@kernel.org>
 <7d692402-3fc1-3b4c-9697-25e722e94539@quicinc.com>
 <87bkn4ds9y.fsf@kernel.org> <87bkl3peg7.fsf@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <87bkl3peg7.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a_3wuEyIaYc9hjpsGdffOfyeWhb4vUhE
X-Proofpoint-ORIG-GUID: a_3wuEyIaYc9hjpsGdffOfyeWhb4vUhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_07,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=816 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_070448_219202_96E6B784 
X-CRM114-Status: GOOD (  18.40  )
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

On 3/8/2023 6:20 AM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
>> Jeffrey Hugo <quic_jhugo@quicinc.com> writes:
>>
>>> On 1/11/2023 2:25 AM, Kalle Valo wrote:
>>>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>>>
>>>> Currently MHI loads the firmware image from the path provided by client
>>>> devices. ath11k needs to support firmware image embedded along with meta data
>>>> (named as firmware-2.bin). So allow the client driver to request the firmware
>>>> file from user space on it's own and provide the firmware image data and size
>>>> to MHI via a pointer struct mhi_controller::fw_data.
>>>>
>>>> This is an optional feature, if fw_data is NULL MHI load the firmware using the
>>>> name from struct mhi_controller::fw_image string as before.
>>>>
>>>> Tested with ath11k and WCN6855 hw2.0.
>>>>
>>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> [...]
> 
>>> Did you run pahole?  I remember this struct being well packed, and I
>>> think this will add a compiler hole but I have not actually verified.
>>
>> I actually haven't used pahole for ages. I will run it and check how
>> this structure is packed.
> 
> Below is what pahole shows with GCC 8.3 on x86_64. Look pretty well
> packed, right?

Yes, looks almost perfect.

> 
> struct mhi_controller {
> 	struct device *            cntrl_dev;            /*     0     8 */
> 	struct mhi_device *        mhi_dev;              /*     8     8 */
> 	struct dentry *            debugfs_dentry;       /*    16     8 */
> 	void *                     regs;                 /*    24     8 */
> 	void *                     bhi;                  /*    32     8 */
> 	void *                     bhie;                 /*    40     8 */
> 	void *                     wake_db;              /*    48     8 */
> 	dma_addr_t                 iova_start;           /*    56     8 */
> 	/* --- cacheline 1 boundary (64 bytes) --- */
> 	dma_addr_t                 iova_stop;            /*    64     8 */
> 	const char  *              fw_image;             /*    72     8 */
> 	const u8  *                fw_data;              /*    80     8 */
> 	size_t                     fw_sz;                /*    88     8 */
> 	const char  *              edl_image;            /*    96     8 */
> 	size_t                     rddm_size;            /*   104     8 */
> 	size_t                     sbl_size;             /*   112     8 */
> 	size_t                     seg_len;              /*   120     8 */
> 	/* --- cacheline 2 boundary (128 bytes) --- */
> 	size_t                     reg_len;              /*   128     8 */
> 	struct image_info *        fbc_image;            /*   136     8 */
> 	struct image_info *        rddm_image;           /*   144     8 */
> 	struct mhi_chan *          mhi_chan;             /*   152     8 */
> 	struct list_head           lpm_chans;            /*   160    16 */
> 	int *                      irq;                  /*   176     8 */
> 	u32                        max_chan;             /*   184     4 */
> 	u32                        total_ev_rings;       /*   188     4 */
> 	/* --- cacheline 3 boundary (192 bytes) --- */
> 	u32                        hw_ev_rings;          /*   192     4 */
> 	u32                        sw_ev_rings;          /*   196     4 */
> 	u32                        nr_irqs;              /*   200     4 */
> 	u32                        family_number;        /*   204     4 */
> 	u32                        device_number;        /*   208     4 */
> 	u32                        major_version;        /*   212     4 */
> 	u32                        minor_version;        /*   216     4 */
> 	u32                        serial_number;        /*   220     4 */
> 	u32                        oem_pk_hash[16];      /*   224    64 */
> 	/* --- cacheline 4 boundary (256 bytes) was 32 bytes ago --- */
> 	struct mhi_event *         mhi_event;            /*   288     8 */
> 	struct mhi_cmd *           mhi_cmd;              /*   296     8 */
> 	struct mhi_ctxt *          mhi_ctxt;             /*   304     8 */
> 	struct mutex               pm_mutex;             /*   312   160 */
> 	/* --- cacheline 7 boundary (448 bytes) was 24 bytes ago --- */
> 	rwlock_t                   pm_lock;              /*   472    72 */
> 	/* --- cacheline 8 boundary (512 bytes) was 32 bytes ago --- */
> 	u32                        timeout_ms;           /*   544     4 */
> 	u32                        pm_state;             /*   548     4 */
> 	u32                        db_access;            /*   552     4 */
> 	enum mhi_ee_type           ee;                   /*   556     4 */
> 	enum mhi_state             dev_state;            /*   560     4 */
> 	atomic_t                   dev_wake;             /*   564     4 */
> 	atomic_t                   pending_pkts;         /*   568     4 */
> 	u32                        M0;                   /*   572     4 */
> 	/* --- cacheline 9 boundary (576 bytes) --- */
> 	u32                        M2;                   /*   576     4 */
> 	u32                        M3;                   /*   580     4 */
> 	struct list_head           transition_list;      /*   584    16 */
> 	spinlock_t                 transition_lock;      /*   600    72 */
> 	/* --- cacheline 10 boundary (640 bytes) was 32 bytes ago --- */
> 	spinlock_t                 wlock;                /*   672    72 */
> 	/* --- cacheline 11 boundary (704 bytes) was 40 bytes ago --- */
> 	struct mhi_link_info       mhi_link_info;        /*   744     8 */
> 	struct work_struct         st_worker;            /*   752    80 */
> 	/* --- cacheline 13 boundary (832 bytes) --- */
> 	struct workqueue_struct *  hiprio_wq;            /*   832     8 */
> 	wait_queue_head_t          state_event;          /*   840    88 */
> 	/* --- cacheline 14 boundary (896 bytes) was 32 bytes ago --- */
> 	void                       (*status_cb)(struct mhi_controller *, enum mhi_callback); /*   928     8 */
> 	void                       (*wake_get)(struct mhi_controller *, bool); /*   936     8 */
> 	void                       (*wake_put)(struct mhi_controller *, bool); /*   944     8 */
> 	void                       (*wake_toggle)(struct mhi_controller *); /*   952     8 */
> 	/* --- cacheline 15 boundary (960 bytes) --- */
> 	int                        (*runtime_get)(struct mhi_controller *); /*   960     8 */
> 	void                       (*runtime_put)(struct mhi_controller *); /*   968     8 */
> 	int                        (*map_single)(struct mhi_controller *, struct mhi_buf_info *); /*   976     8 */
> 	void                       (*unmap_single)(struct mhi_controller *, struct mhi_buf_info *); /*   984     8 */
> 	int                        (*read_reg)(struct mhi_controller *, void *, u32 *); /*   992     8 */
> 	void                       (*write_reg)(struct mhi_controller *, void *, u32); /*  1000     8 */
> 	void                       (*reset)(struct mhi_controller *); /*  1008     8 */
> 	size_t                     buffer_len;           /*  1016     8 */
> 	/* --- cacheline 16 boundary (1024 bytes) --- */
> 	int                        index;                /*  1024     4 */
> 	bool                       bounce_buf;           /*  1028     1 */
> 	bool                       fbc_download;         /*  1029     1 */
> 	bool                       wake_set;             /*  1030     1 */
> 
> 	/* XXX 1 byte hole, try to pack */
> 
> 	long unsigned int          irq_flags;            /*  1032     8 */
> 	u32                        mru;                  /*  1040     4 */
> 
> 	/* size: 1048, cachelines: 17, members: 73 */
> 	/* sum members: 1043, holes: 1, sum holes: 1 */
> 	/* padding: 4 */
> 	/* last cacheline: 24 bytes */
> };
> 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
