Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3A8C433EF
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfsM/EJKnWmqMdj/0sMmHPNJTVxwvcW6fflq2GRQVNc=; b=S7i1UIfIvx/A4O
	GEgyXub2IXS6ZxVamepI6McMw4cRRHSW4JjE5IeIpWiuJ6k7S/9TBjkGruA+BslXGCeqPUYA64zb8
	vG88pXhSnsgOcpjSfhPxi/Pi2znUaBip4CNwoegog2hu1kuHdRcNoyCdRHx7sKmjDppV6+v2D4lxt
	yZDVhoetGOkJowvjdZ+tHlUIDYvNyG9tErdfEUxAjA3nIfxeBMuXssWx6UU3leEM2hPfxFj003QaL
	phl8ClvJh9Snh3brk5B7j7Q/lpRAdbz7/ra3bmrlhlbeftmdkzkwWNs1pBZPGCKuUM+WFWFhq4vJp
	XC1uca+t8qtXegbcFT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDLcd-000oEz-1q; Fri, 28 Jan 2022 07:24:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDLcZ-000oDS-U7
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 07:24:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 613DD618B6;
 Fri, 28 Jan 2022 07:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFDCC340E0;
 Fri, 28 Jan 2022 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643354674;
 bh=Pyz/0cK9sHlVyb9040g7CTXTIxSeN8ehl1ubzZKkac0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=lI+hanDa7k8o3cE9VKmljM70xYH2eS28YONmjBXXG4zxxFHdTiUt9Jp+dyjj9aNsw
 +FFAdisSNQAhM2a1Nu7R3NVnfMMd2UUBpvK3zy84KTovIJAKQrmzszvlfsSxsN6p89
 4ueJH9CtPjQMcVcDA6Su6VQdzzWCApPngpg2UINoexTp97JzlbGYIPHK23sEZAxmkM
 sTcIwybpS6ZCA5IMwluTItg1qCw7pKiYKPKfIV9p6Y4ICaMyEUmyLCdZgozHPOgyyj
 1kPeMIZePux5R8p77qtfB+H4TMwMm2XY7ygHEQuFdc5zqur3U9RSLtuy5K3rVj0hw2
 1jyiOI3MHV7Rw==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kbuild@lists.01.org, Anilkumar Kolli <akolli@codeaurora.org>, lkp@intel.com,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org
Subject: Re: drivers/net/wireless/ath/ath11k/qmi.c:1891
 ath11k_qmi_assign_target_mem_chunk() error: uninitialized symbol 'ret'.
References: <202201272025.7AWXB5T7-lkp@intel.com>
Date: Fri, 28 Jan 2022 09:24:28 +0200
In-Reply-To: <202201272025.7AWXB5T7-lkp@intel.com> (Dan Carpenter's message of
 "Fri, 28 Jan 2022 10:07:04 +0300")
Message-ID: <87sft8cogj.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_232436_082016_C8F595BE 
X-CRM114-Status: GOOD (  11.53  )
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

(adding ath11k list)

Dan Carpenter <dan.carpenter@oracle.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
> commit: 6ac04bdc5edb418787ab2040b1f922c23464c750 ath11k: Use reserved host DDR addresses from DT for PCI devices
> config: microblaze-randconfig-m031-20220127 (https://download.01.org/0day-ci/archive/20220127/202201272025.7AWXB5T7-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 11.2.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> drivers/net/wireless/ath/ath11k/qmi.c:1891 ath11k_qmi_assign_target_mem_chunk() error: uninitialized symbol 'ret'.
>
> Old smatch warnings:
> drivers/net/wireless/ath/ath11k/qmi.c:2161 ath11k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.
>
> vim +/ret +1891 drivers/net/wireless/ath/ath11k/qmi.c
>
> 6eb6ea51382873 Govind Singh          2020-08-14  1876  static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
> d5c65159f28953 Kalle Valo            2019-11-23  1877  {
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1878  	struct device *dev = ab->dev;
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1879  	struct device_node *hremote_node = NULL;
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1880  	struct resource res;
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1881  	u32 host_ddr_sz;
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1882  	int i, idx, ret;
> d5c65159f28953 Kalle Valo            2019-11-23  1883  
> d5c65159f28953 Kalle Valo            2019-11-23  1884  	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
> d5c65159f28953 Kalle Valo            2019-11-23  1885  		switch (ab->qmi.target_mem[i].type) {
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1886  		case HOST_DDR_REGION_TYPE:
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1887  			hremote_node = of_parse_phandle(dev->of_node, "memory-region", 0);
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1888  			if (!hremote_node) {
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1889  				ath11k_dbg(ab, ATH11K_DBG_QMI,
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1890  					   "qmi fail to get hremote_node\n");
> 6ac04bdc5edb41 Anilkumar Kolli       2021-12-14 @1891  				return ret;
>
> "ret" not set.

Anil, can you send a patch to fix this?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
