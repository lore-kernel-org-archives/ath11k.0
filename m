Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E87C55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 06:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+j0OGu8yNND2r1cN+Lm4pSp6KVSulbgFN7qITczYf78=; b=vkluvC+JjHFLkSqGnckOjM8uAw
	hGxm+QNGmx7kgT73hKyRdWA3Z3+C2jbf52odYlG1XbGJq/FkEElU4wf2aY4j+Lya/xCmvn5vd9U1f
	076jN/QmDogKi47pyLQRTL2G9cc4gEHzQ0+Gj/qA7VXoQgWFGesKsulhk/jyD1vdgjHk94cNLLDVA
	EAJjr1ISZVDoQJ297zcYe8w3FTL2INM3yHDehI/aSOZXIB4NVgHFHa5WlFoQM/4u0OgLFA7lZDC++
	GY3PnwtuAQZJoBwcck4JF1RUYH9vSFDex5/HjbboolA1Xpti7JRUkx9TC/181U68uftW3L+iTIBnN
	LSG63BYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wph3V-0000000BupK-2F5n;
	Fri, 31 Jul 2026 06:49:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wph3T-0000000Buoq-2fri
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 06:49:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5HZBm3235817
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 06:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+j0OGu8yNND2r1cN+Lm4pSp6KVSulbgFN7qITczYf78=; b=BnHeCT3+YvVeaVcK
	KHzzUB0Qc7jdP18Yjx6MjfycwLJDsSdVfSH6I0uuRGq7Tr1b1f7abcYdIotvKyRg
	eCjqS9QfbLIZCaFARX0g9n9D+RoHdRnurnaa8dz+jtwWiVzupof3QCqI3kWTPf9B
	0qRsXcUkn5QeSs0092bEBaj6djiIzPPoDqac1LvKJPTisMYRP2tTtTsJlE2VPdlj
	6skeXJO8ZVi0AMjbwiXBVzmhnunguPMUzmVXB8iCnEPhL2iB9Vn/nC7ISwAL3AKy
	4lp8H1kds3xydj3dFnvg8re7irer9RzDWkH1/kSrklHOB90KVqbNJcBcXXeF1iz0
	lbwEnQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frne50arv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 06:49:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so14261715ad.2
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480554; x=1786085354; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+j0OGu8yNND2r1cN+Lm4pSp6KVSulbgFN7qITczYf78=;
        b=QNIUzGEmbL013Z97lv1uYrP6fs+R2ulO+YXLliUWVidfBy2FDpc8mEGsRRnN9s7V0O
         o6mqPkG3UundkT8BSl3TWJ/bbQNt6fuFCHS9TznsWN05MGz3SikYpcCOoniyY9InQOwE
         D31MnF/t+mz/c999rrzaLKps2RNQJexRbMz5cSLoeY4tXELc/cEMsQAOEHOGi0nYzLI4
         5olnHApHUDsqDHHKKxh6VWdKHKWx/drO+NeuIjsdToLnvTZfbs1Nqnl2rZBB9mkEL21a
         w38Qwy0XDost67w1V6DFDazURGqp0zxEvggqYNNWZI0METEit4IZ15MnpE3MO2g53StS
         pU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480554; x=1786085354;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+j0OGu8yNND2r1cN+Lm4pSp6KVSulbgFN7qITczYf78=;
        b=ADdOsM4+0YXsv/bqrKOQVAelQOMcrYT4Zid5uURsLex69TGgCLsOT3sZMXtIDIbboU
         WLSNRvtxrIsDYacWr12FqpZafbrQp74En2jIeKupbXtdguiLxFWwv/dudyRpIqp6zx8B
         PnAxW9UYad5/Z1bk0B4LatAEyNWaqjCOcLp/fj4T3ql2jp9O/8lU336lCiWy3nTD3FRu
         SwSBVCkSdzJvfVBuFYPyKGTWLGnv0Z93uiYJC8XFYiewvehzDNcFyrolEje3+nVEpDo7
         HhemEuU7D8psQctQnnqu68ifxY8XuExoE5h8EzzsPBMnJhCRiIX/iJf3SbWNbtv694+n
         WYRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2KEQLDFcIUwcxevGKbyFbeXwLf15cbUgJjbmBFm5jZ2HfAq5EaexQzQzP7ofov1UpqBc2f/A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx85K74awXXVJLb+KZt2lZwmcTJGEp+gir8w3zd68F2kouNKzIS
	3g+9YWz+M6IJ0dND7VKAoGxIjg6orw8qnml/0rDmQjZyXChogr10iDeEIxUYGLbRWollhIBwlJS
	d5XhEYvm9yScwhUHX0ly9Qq24XF2+rAUKRcB9wQgiHLE2GIF0DFptNEC+1XjOvj4F
X-Gm-Gg: AR+sD11dpHKMikjXjDQyVss2ANWncGRL6X1w7YGJFMI05jspQhpeZOB5YXYh67zynoK
	7zWRvJBbGrU2gD81yKDUDtZi+iQn5xFA9eJywwAA3ZjeBmOGPP67r8P3je/eOKds+ONEaJO04Kv
	KgnK2KffryYj7qKMkttwEyCLlok2hl3Et8lS2M/fuxCz5MEbDqV5yP5uIIic6y3YW61829OJW4z
	ymtTIu7pz7C96dxhmk+M7B0Q8j/ezj6yAtZBWjtdN1QJeKVBm8F24eapL/rdauNUgNH30xgufTK
	didGaeg7heWIR5JAHAi6Qv4rP47tmwpAbd1ifUnWaRdPrCs/HvA0UVjBQNiKmUOAJju/4UZ32A7
	RlPmBJG0yP7GgH2TIPaTP5ESGDOX6dogMcsvbUha5ivDbrRe6RWnwPjOYZAVklqid/QSN4cDQRQ
	==
X-Received: by 2002:a17:902:ea01:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d046d915c4mr9637585ad.13.1785480554230;
        Thu, 30 Jul 2026 23:49:14 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d046d915c4mr9637435ad.13.1785480553680;
        Thu, 30 Jul 2026 23:49:13 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb5a3sm1235665ad.46.2026.07.30.23.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:49:13 -0700 (PDT)
Message-ID: <387b4bb6-b0e4-471a-9276-211ecdedb58e@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:49:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath11k: fix locking problem in
 ath11k_dp_rx_tid_del_func()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Maxime Bizon <mbizon@freebox.fr>
References: <20260729085741.3485711-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729085741.3485711-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ftzsol4f c=1 sm=1 tr=0 ts=6a6c456a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=Z6wsjZpKeX7lfRFmj2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NiBTYWx0ZWRfX49c3b/5cbD0T
 plpm1HxLdVO1McNY4WrbR2Ujns2xDHqmTg3b0weAb5J2Cfdr0n0gkck2mC5XQ9ap/3YdF6SnnvV
 kk8tcsCKtBDWRKx07O6UUzvtBVU6P44=
X-Proofpoint-ORIG-GUID: hRQqQHoqQrK_hEosgDNyzYx2ywZHwYWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NiBTYWx0ZWRfXyM1DupkXysjy
 LUjGyvm83NsiDId0r4P4lVGAYHxvGXVq1ZiOssKRqrz/tl2xs/vPpxUK0bGok1X62vMtnv/+Ymq
 bcJma63sJBU+BC5X4EIBaDOu2MAHzhGY8r090PqrBW9pBqmjJND58QcuND+GRvObpbd9yh3724z
 AL4jfNvsDVj1nVEZj2xADHt1UC6Ypo6BP2Vb22yMJxfgkpVsmhY+XUEent9zJPkD2IzuTctSMoc
 xuU4XZa6dBYcJy6vB41zpeQXWT/uy+2K9yYKXKRF3D7TIiMjmXBzR/SsVUi8VoOoSl4ek76cGgC
 XKyvMzh7LEn6zgB556IAH1Ihe54RzQmoGJiqCgfqJqLMZEUbi3naC8pSB2AxhGy6r/pdcZTYfKw
 zGdFUZXjnSXe+eo5t47hDK1o9T33y/PBx98nIJph9udU7Ej4Uxawv9uiDinmFy3PTDpfBV689Pd
 O5PD4vnQdvQAa8r/0NQ==
X-Proofpoint-GUID: hRQqQHoqQrK_hEosgDNyzYx2ywZHwYWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_234915_683960_20A87F23 
X-CRM114-Status: GOOD (  28.03  )
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



On 7/29/2026 4:57 PM, Nicolas Escande wrote:
> From: Maxime Bizon <mbizon@freebox.fr>
> 
> In this function, we iterate over dp->reo_cmd_cache_flush_list using
> list_for_each_entry_safe(), and for each expired entries we call
> ath11k_dp_reo_cache_flush() then free the entry. As this can be called
> from multiple CPU we protect for concurrent access using dp->reo_cmd_lock.
> 
> The lock is dropped to call ath11k_dp_reo_cache_flush() and taken again
> before keeping iterating over the loop. That is broken.
> 
> The list_for_each_entry_safe() protects over deleting the entry being 
> iterated over but does not protect for concurrent access. So another
> thread might have taken the lock in between and modified the list, leading
> to a crash (see bellow). 

nit: s/bellow/below/

> 
> So fix it by restarting iterating over the list from the start once the
> lock is retaken.
> 
> 	BUG: Unable to handle kernel paging request at virtual address 00000010ddbeef8c
> 	Mem abort info:
> 	ESR = 0x0000000096000045
> 	EC = 0x25: DABT (current EL), IL = 32 bits
> 	SET = 0, FnV = 0
> 	EA = 0, S1PTW = 0
> 	FSC = 0x05: level 1 translation fault
> 	Data abort info:
> 	ISV = 0, ISS = 0x00000045
> 	CM = 0, WnR = 1
> 	user pgtable: 4k pages, 39-bit VAs, pgdp=000000000593f000
> 	[00000010ddbeef8c] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> 	Internal error: Oops: 0000000096000045 [#1] SMP
> 	Modules linked in: ath11k_pci XXX
> 	CPU: 1 PID: 1775 Comm: napi/-29 Not tainted XXXX
> 	Hardware name: XXXX
> 	pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	pc : ath11k_dp_rx_tid_del_func+0x164/0x3c8
> 	lr : ath11k_dp_rx_tid_del_func+0x2a0/0x3c8
> 	sp : ffffff8020c2fb90
> 	x29: ffffff8020c2fb90 x28: ffffff80207ae910 x27: 0000000000000080
> 	x26: ffffffc00861ebe4 x25: ffffffc008cefb88 x24: ffffff800d701b2c
> 	x23: 00000010ddbeef84 x22: ffffff800d701448 x21: ffffff8030e22d00
> 	x20: ffffff800d700000 x19: 0000000000000080 x18: 0000000000000000
> 	x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> 	x14: 0000000000000026 x13: ffffff801958a100 x12: 0000000000000000
> 	x11: 0000000000000001 x10: 0000000000000001 x9 : fffffffe0081eba0
> 	x8 : ffffff801cc49300 x7 : ffffffc008f87130 x6 : ffffff80207ae900
> 	x5 : 0000000000210d00 x4 : 0000000000000000 x3 : 0000000000000000
> 	x2 : 000000010024519a x1 : 00000010ddbeef84 x0 : ffffff800d701b08
> 	Call trace:
> 	ath11k_dp_rx_tid_del_func+0x164/0x3c8
> 	ath11k_dp_process_reo_status+0x1d4/0x2fc
> 	ath11k_dp_service_srng+0x334/0x338
> 	ath11k_pcic_ext_grp_napi_poll+0x30/0xc0
> 	__napi_poll+0x34/0x184
> 	napi_threaded_poll+0xb4/0x1d8
> 	kthread+0xdc/0xe0
> 	ret_from_fork+0x10/0x20
> 	Code: b946e2c0 7101001f 54fffe29 a94002a1 (f9000420)
> 
> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

hardware version missing betweeen target and bus type

QCN9074 hw1.0 PCI

> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 8e2abc7b8383..b8f939f7c04b 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -784,6 +784,7 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
>  	dp->reo_cmd_cache_flush_count++;
>  
>  	/* Flush and invalidate aged REO desc from HW cache */
> +retry:
>  	list_for_each_entry_safe(elem, tmp, &dp->reo_cmd_cache_flush_list,
>  				 list) {
>  		if (dp->reo_cmd_cache_flush_count > DP_REO_DESC_FREE_THRESHOLD ||
> @@ -796,6 +797,7 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
>  			ath11k_dp_reo_cache_flush(ab, &elem->data);
>  			kfree(elem);
>  			spin_lock_bh(&dp->reo_cmd_lock);
> +			goto retry;
>  		}
>  	}
>  	spin_unlock_bh(&dp->reo_cmd_lock);

while this seems the minimal fix which stable team might prefer, how about refactoring as
firstly detaching all the expired entries onto a local list under the lock and flushing
that list afterwards:

  LIST_HEAD(flush_list);

  spin_lock_bh(&dp->reo_cmd_lock);
  list_for_each_entry_safe(elem, tmp, &dp->reo_cmd_cache_flush_list, list) {
        if () {
                list_move_tail(&elem->list, &flush_list);
        }
  }
  spin_unlock_bh(&dp->reo_cmd_lock);

  list_for_each_entry_safe(elem, tmp, &flush_list, list) {
        list_del(&elem->list);
        ath11k_dp_reo_cache_flush(ab, &elem->data);
        kfree(elem);
  }

This fully decouples the concurrency from the flushing: the detach phase runs entirely
under the lock, and the flush phase walks a thread-private list where no concurrency
exists. It's a single O(N) pass instead of the O(N^2) worst case of re-scanning from the
head, and it avoids bouncing reo_cmd_lock once per freed entry.

Also this seems simpler and more direct — its correctness is obvious by construction;
while the fix of this patch is less self-evident: a reader may not easily grasp why the
code has to rescan from the head after re-taking the lock.

Non-blocking though — either form fixes the crash. If you'd rather keep the minimal goto
retry for the stable backport and do the detach-list version as a follow-up cleanup, that
works for me too.


