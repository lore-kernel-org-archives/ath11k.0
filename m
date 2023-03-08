Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DB8C678D5
	for <ath11k@archiver.kernel.org>; Wed,  8 Mar 2023 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUqVhgFfRwEexKgCGBr6T2OyQMsPkeplkMs9ngfNg3Q=; b=VfxnJ6vK5sHhwE
	kHiFjYy/Q4xkRycth2H3/Z+Tjkjb9sd92uR9W8Z6KZWd8cqm+3sbJcWKfUn6on8+DyykH2VA8qoDL
	PyQK0IhIcFxl20E2HGDwsiyX8MS6pwvlMlb0vMmmYzpR+jPq1CklY/lDKATn07HyQ7pCK1JafbUR7
	wP9WuExg2ioi5L4+thVnqrhyEoi7FY2Ix6DqHc2Y8slf8scFFQKn9M9XtOs8MTGbcH0jDlmaTYMfd
	KR4Bl8k5lhIg2AiHogrUwUs4vRS86AxU/s5nYcU4b/xDtDLjOK6cB308ijjtLHYozXJi4naXsRPFI
	aVtmnrqbyzfiQkoMwI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZuoh-005Sa6-8h; Wed, 08 Mar 2023 14:30:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtiX-005A6F-IV
	for ath11k@lists.infradead.org; Wed, 08 Mar 2023 13:20:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFF02617C5;
	Wed,  8 Mar 2023 13:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDB9C4339C;
	Wed,  8 Mar 2023 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678281628;
	bh=MP+KW6D6LvzYPD/GB8Lxjmh685nCFxeBh6MtYQgx8rA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=m/D1pB7WwZi3QIbD53+pgH6T2oM8IglGXrtgk+pF9NZlOBZcDbL6sao8asq1u/T5n
	 Fu5NI0wrNQbXGX/U6LB0Q7nepRGMcm8HCvS4RIxUssn2rmCRprTAk+b1gbeJvhztkZ
	 Da97fr6C2GnRzX4+y8LKHMhwSV5X+zikFZ0RQvyMEg4I8cHukgapvoKSHFXXOr0Iv6
	 iVmuc2bzggDeFK8P2hDa7I+Wcogq/ad2hC/WskQKdGXQk188hYpo793FYwdwrgAzZu
	 TbjiZHNLiu77Lo3K6lFEnERCR2aSod4NEPee6ii1aIxwCJcz5cyxPv+ivfIvIhsg5B
	 Rbyf4JpJiXRvw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: <mhi@lists.linux.dev>,  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] mhi: allow MHI client drivers to provide the firmware via a pointer
References: <20230111092547.21425-1-kvalo@kernel.org>
	<20230111092547.21425-2-kvalo@kernel.org>
	<7d692402-3fc1-3b4c-9697-25e722e94539@quicinc.com>
	<87bkn4ds9y.fsf@kernel.org>
Date: Wed, 08 Mar 2023 15:20:24 +0200
In-Reply-To: <87bkn4ds9y.fsf@kernel.org> (Kalle Valo's message of "Thu, 12 Jan
	2023 11:19:21 +0200")
Message-ID: <87bkl3peg7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_052029_781533_EF58EF11 
X-CRM114-Status: GOOD (  16.21  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Jeffrey Hugo <quic_jhugo@quicinc.com> writes:
>
>> On 1/11/2023 2:25 AM, Kalle Valo wrote:
>>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>>
>>> Currently MHI loads the firmware image from the path provided by client
>>> devices. ath11k needs to support firmware image embedded along with meta data
>>> (named as firmware-2.bin). So allow the client driver to request the firmware
>>> file from user space on it's own and provide the firmware image data and size
>>> to MHI via a pointer struct mhi_controller::fw_data.
>>>
>>> This is an optional feature, if fw_data is NULL MHI load the firmware using the
>>> name from struct mhi_controller::fw_image string as before.
>>>
>>> Tested with ath11k and WCN6855 hw2.0.
>>>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

>> Did you run pahole?  I remember this struct being well packed, and I
>> think this will add a compiler hole but I have not actually verified.
>
> I actually haven't used pahole for ages. I will run it and check how
> this structure is packed.

Below is what pahole shows with GCC 8.3 on x86_64. Look pretty well
packed, right?

struct mhi_controller {
	struct device *            cntrl_dev;            /*     0     8 */
	struct mhi_device *        mhi_dev;              /*     8     8 */
	struct dentry *            debugfs_dentry;       /*    16     8 */
	void *                     regs;                 /*    24     8 */
	void *                     bhi;                  /*    32     8 */
	void *                     bhie;                 /*    40     8 */
	void *                     wake_db;              /*    48     8 */
	dma_addr_t                 iova_start;           /*    56     8 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	dma_addr_t                 iova_stop;            /*    64     8 */
	const char  *              fw_image;             /*    72     8 */
	const u8  *                fw_data;              /*    80     8 */
	size_t                     fw_sz;                /*    88     8 */
	const char  *              edl_image;            /*    96     8 */
	size_t                     rddm_size;            /*   104     8 */
	size_t                     sbl_size;             /*   112     8 */
	size_t                     seg_len;              /*   120     8 */
	/* --- cacheline 2 boundary (128 bytes) --- */
	size_t                     reg_len;              /*   128     8 */
	struct image_info *        fbc_image;            /*   136     8 */
	struct image_info *        rddm_image;           /*   144     8 */
	struct mhi_chan *          mhi_chan;             /*   152     8 */
	struct list_head           lpm_chans;            /*   160    16 */
	int *                      irq;                  /*   176     8 */
	u32                        max_chan;             /*   184     4 */
	u32                        total_ev_rings;       /*   188     4 */
	/* --- cacheline 3 boundary (192 bytes) --- */
	u32                        hw_ev_rings;          /*   192     4 */
	u32                        sw_ev_rings;          /*   196     4 */
	u32                        nr_irqs;              /*   200     4 */
	u32                        family_number;        /*   204     4 */
	u32                        device_number;        /*   208     4 */
	u32                        major_version;        /*   212     4 */
	u32                        minor_version;        /*   216     4 */
	u32                        serial_number;        /*   220     4 */
	u32                        oem_pk_hash[16];      /*   224    64 */
	/* --- cacheline 4 boundary (256 bytes) was 32 bytes ago --- */
	struct mhi_event *         mhi_event;            /*   288     8 */
	struct mhi_cmd *           mhi_cmd;              /*   296     8 */
	struct mhi_ctxt *          mhi_ctxt;             /*   304     8 */
	struct mutex               pm_mutex;             /*   312   160 */
	/* --- cacheline 7 boundary (448 bytes) was 24 bytes ago --- */
	rwlock_t                   pm_lock;              /*   472    72 */
	/* --- cacheline 8 boundary (512 bytes) was 32 bytes ago --- */
	u32                        timeout_ms;           /*   544     4 */
	u32                        pm_state;             /*   548     4 */
	u32                        db_access;            /*   552     4 */
	enum mhi_ee_type           ee;                   /*   556     4 */
	enum mhi_state             dev_state;            /*   560     4 */
	atomic_t                   dev_wake;             /*   564     4 */
	atomic_t                   pending_pkts;         /*   568     4 */
	u32                        M0;                   /*   572     4 */
	/* --- cacheline 9 boundary (576 bytes) --- */
	u32                        M2;                   /*   576     4 */
	u32                        M3;                   /*   580     4 */
	struct list_head           transition_list;      /*   584    16 */
	spinlock_t                 transition_lock;      /*   600    72 */
	/* --- cacheline 10 boundary (640 bytes) was 32 bytes ago --- */
	spinlock_t                 wlock;                /*   672    72 */
	/* --- cacheline 11 boundary (704 bytes) was 40 bytes ago --- */
	struct mhi_link_info       mhi_link_info;        /*   744     8 */
	struct work_struct         st_worker;            /*   752    80 */
	/* --- cacheline 13 boundary (832 bytes) --- */
	struct workqueue_struct *  hiprio_wq;            /*   832     8 */
	wait_queue_head_t          state_event;          /*   840    88 */
	/* --- cacheline 14 boundary (896 bytes) was 32 bytes ago --- */
	void                       (*status_cb)(struct mhi_controller *, enum mhi_callback); /*   928     8 */
	void                       (*wake_get)(struct mhi_controller *, bool); /*   936     8 */
	void                       (*wake_put)(struct mhi_controller *, bool); /*   944     8 */
	void                       (*wake_toggle)(struct mhi_controller *); /*   952     8 */
	/* --- cacheline 15 boundary (960 bytes) --- */
	int                        (*runtime_get)(struct mhi_controller *); /*   960     8 */
	void                       (*runtime_put)(struct mhi_controller *); /*   968     8 */
	int                        (*map_single)(struct mhi_controller *, struct mhi_buf_info *); /*   976     8 */
	void                       (*unmap_single)(struct mhi_controller *, struct mhi_buf_info *); /*   984     8 */
	int                        (*read_reg)(struct mhi_controller *, void *, u32 *); /*   992     8 */
	void                       (*write_reg)(struct mhi_controller *, void *, u32); /*  1000     8 */
	void                       (*reset)(struct mhi_controller *); /*  1008     8 */
	size_t                     buffer_len;           /*  1016     8 */
	/* --- cacheline 16 boundary (1024 bytes) --- */
	int                        index;                /*  1024     4 */
	bool                       bounce_buf;           /*  1028     1 */
	bool                       fbc_download;         /*  1029     1 */
	bool                       wake_set;             /*  1030     1 */

	/* XXX 1 byte hole, try to pack */

	long unsigned int          irq_flags;            /*  1032     8 */
	u32                        mru;                  /*  1040     4 */

	/* size: 1048, cachelines: 17, members: 73 */
	/* sum members: 1043, holes: 1, sum holes: 1 */
	/* padding: 4 */
	/* last cacheline: 24 bytes */
};

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
