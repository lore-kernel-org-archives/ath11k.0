Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59393CD4F21
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 23:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j27ntAJ+N1LZSw0iXAtPGZfZuXUE/x84Crfg5pmEaIY=; b=wShCeL8Ja2XWkAD5hiPNTq28Bn
	sj+/Bm1MUzTCNgqVxXnWGoFZ8NuCnXirJH+8YO6XGRwQnAtpPrfSW9VKnkv2qZaP69E54tZjr0EB3
	U/5Cg5c+Ke+tinXz4LuZG10wmepQvNEBMl82Mr44WmtWzGmUmx+4EpP49ZzkZWuDY0bY9QcGK47/c
	CWrchcj3sHlWPmhPBgY30AGkWz/cl0QGCNOIeZkWX3Y/Nj/xTUFg7NfzGGzTlPy1LURXMTLUX5Z39
	2ylgyFCLNzVs5ixXlkLgomiPctrlK9avMZIO0hVupTdLxkn6AR7vOAvTtW4468da7RvD8WlT+SLob
	p1LggRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwNb-00000000gCc-08yf;
	Tue, 12 May 2026 23:19:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwNY-00000000gC7-1BbW
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 23:19:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CLnF7b1805711
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 23:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j27ntAJ+N1LZSw0iXAtPGZfZuXUE/x84Crfg5pmEaIY=; b=JzujmVnb1gC8bscZ
	Hzt1tsDSD+8WUB2IskIW6OEaYO679MD5yVKeZY0q+skQXve0Y5P9WMnbELBEbzjj
	IlawRRsBofNjsMPQyO43k6NXf6snePYb75crICP0KW02ID4Q1axVFErT0xDchCm6
	wvSXBsK03PKf5ANg8ttqCZp9IW/Tp54gLxSvxm3UeCFSbu6XiRyVmjJa1cRWpbao
	V7R6rWrRuLCGj7ZOg0c2BwFOvmy5nPYSZvUpuG/VLE5HaOy7EGkRhpPnV1dApvk9
	gPTZuKacC4GM1OxzNP8rnI9CyaIdqUfQTxeIf3Ptt1jgaTMS7HjWgA3W8kTFa2ku
	lCTuog==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444stc33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 23:19:07 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-130aab78a09so6010899c88.0
        for <ath11k@lists.infradead.org>; Tue, 12 May 2026 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778627946; x=1779232746; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j27ntAJ+N1LZSw0iXAtPGZfZuXUE/x84Crfg5pmEaIY=;
        b=ADnW36+Vw9dQWr7T3G8/zPopD7vf3e/1/VuWc9jTYcVhPWbPjeKeCv1615Fz03e/g+
         5rASx5Mlf2kF+KN2QcZyeEYzPZ/l+upeIkhH3yUWBNW8GyDBHgJDkX7NJ/Kf0HThmjqv
         UngZFJdovIl+fAnAqglMArz7HmafG/NMOZCmCCyfmM1z/WTzPty9rW1bhEp/0rPKkdfi
         VqUlk0RoKzHs/d2yFyCB8oKnuEqwDZF0uSV13EnHt+o26MoTtKFGT32nbZ+lCegFDRY0
         lBy/RmLsnPzRTcVLhCbZI2HCE4wb4xzUsNTqsmyCfZHkhxMIPkGuUlOe0JwX/u360AsU
         a7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627946; x=1779232746;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j27ntAJ+N1LZSw0iXAtPGZfZuXUE/x84Crfg5pmEaIY=;
        b=q7ECKK7WX/IQN+cgSqrZTygWXDvztkzKtEf7kr48fcK7h0AoT4KRDy62ArKH5plT32
         KuF8GSJl1vJ1kyWYJ4WUhMEuy9a9DyaRDaVGc5RnnOFVIqzX3jyApmOFHH2C7WQt8hlj
         exhaApz2z4T+gwv4PHDX7Kfjjb3cx26ljo5+lTthvLrEFogemH0NhQfHRS03HEJGvACw
         Qj9sEFTabtCGE+tCLl5eK3ZaqKas6JCqUxyPmINkirDlgxpvx4jQ2XvF9Pggi9+7sJwk
         JzSXqCvSRPxjGkavczEnuf9W8Yq0ZvZBz7XMUPpJIFzq4UMMfwQAFQRweikvzsWLj8NI
         XT9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+3FgWmLs92pYG41EVIlvNFQJWKhdUF6RevFUl2k0+82hMaE7SRag6Bl8hGoKRLuqd2zPoiFbU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhDtya/zO+9rbiVHP4/lHIqRqHVUSuI34ivvOeQsrtozJ6ALD8
	4BaVz1UQcEBTxKrERI7L/RU85SMj32BqHrqUo2oQQkfNkPk9mC11KxnSTMmmaeuFPfPiyhEnQ9S
	fAWFv9tNEic+Loxx9nb4MEsX2zHbmOYwLIW+Rt3WZhwdlVot7SWdtFiwXH/3swmMjPkJaiqNR
X-Gm-Gg: Acq92OHMlidQpSFQaJU9fg9x/D6bo3KKLX8+2L+FaJkbli3SY62Gc+Lj1ZE9F9oAI5/
	2EXvxi6VSXqGSM61ZSPEEAuge8LCThiHwqi5ctf6dYD0f/Cr0nrkRhamGVmcdZDaXW8gk97stwn
	lGHavLT9JZh6bPhEvFtn+6rb/iFSokpgdKK1ZK95aBJg3dQKAcf1qFEsbGUTLKrxN+YrpVCCmoX
	zRCvXJBlCaoepb0shzn9eIwBB4699dKe4LJkvryV5vZDWiiml+vIAQPqDRdoJIhMaJEpT3ZC6Jb
	StImyZPYv9HNxXTskbHH+oyu3Q1fqoPSoYjOFThOOXs6xfwd6E+QbSjEEMMjcZ8/3Vf+h7OQ75L
	TsOk+A4YQO1J1+p+fU3YbvBLCembBkRe3eoaLpFOaQLyk+9z4DReAzI9yi2VEEGrV4xu3ruzxF2
	n3u2aZkIGg2CdUQQ==
X-Received: by 2002:a05:7022:225:b0:128:cf80:deea with SMTP id a92af1059eb24-1342ee3a12cmr528527c88.1.1778627946476;
        Tue, 12 May 2026 16:19:06 -0700 (PDT)
X-Received: by 2002:a05:7022:225:b0:128:cf80:deea with SMTP id a92af1059eb24-1342ee3a12cmr528505c88.1.1778627945868;
        Tue, 12 May 2026 16:19:05 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm25517183c88.4.2026.05.12.16.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 16:19:05 -0700 (PDT)
Message-ID: <2edfe25b-2190-4463-bbba-b2468d872a4c@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:19:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND RFC 3/3] net: ath11k: add lockup simulation via
 debugfs
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260330-ath11k-lockup-fixes-v1-0-7ed21095c2c4@collabora.com>
 <20260330-ath11k-lockup-fixes-v1-3-7ed21095c2c4@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260330-ath11k-lockup-fixes-v1-3-7ed21095c2c4@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _bZu6Bdq_lr-nzVQP4BjIfn3hdYCuHp8
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a03b56b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QX4gbG5DAAAA:8 a=MEfDkqlxHPSrZSc_TmcA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: _bZu6Bdq_lr-nzVQP4BjIfn3hdYCuHp8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIzOCBTYWx0ZWRfX33MKmUZSSG/O
 gYnl5u19+LKnzF9BzGGKQZlGZOzpFXpDEcklbejV3Z/7NmidvscdWP3vuLtMiJxvC3OGgDhonBL
 paTMPb3Y9NdmTR1QdE7tDuBKRSyECWnxOhvn7ATtpNqUFcVLEhosC3G81jf2yuwxH0WndInC226
 Kgn8kojKWYGkHT6NK5cmbwK18nuyFfkwn2fyDBiZcP22H3B3vgyq8Tv5QKnbJ1EJecFKsHbx3vS
 lwg/c8A3hYc+foWjBChJt0kLj/3HtxuGcvgBWQOWBhHPXv0KqyGIx3nHl5R5LXA7OiuujeCLtba
 bf2uHgrYqeX55NA8zJP15ERBxWd3QFP3az7FClbJ6SRMnnWDX/swmbWVi1dN3ecv9dq2V0TSoNW
 vs4gc5qlkbvdNBinJALJjJz4LQMxCXsThpADTb/BvAM+bI3H99m95e46OA9Aj7sNdOdE1i6aaCa
 KeLTPJ0/JbTrQ99lCkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120238
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_161908_342751_0A38DE81 
X-CRM114-Status: GOOD (  24.66  )
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

On 3/30/2026 3:05 AM, Matthew Leach wrote:
> Add a debugfs command to simulate a firmware lockup.
> 
> This does not hang the hardware. Instead, it forces the driver down an
> error path that reproduces the sequence observed during real lockups:
> 
>   ath11k_pci 0000:03:00.0: failed to transmit frame -12
>   ath11k_pci 0000:03:00.0: failed to transmit frame -12
>   ath11k_pci 0000:03:00.0: failed to transmit frame -12
>   ...
>   ath11k_pci 0000:03:00.0: wmi command 28680 timeout
>   ath11k_pci 0000:03:00.0: failed to submit WMI_MGMT_TX_SEND_CMDID cmd
>   ath11k_pci 0000:03:00.0: failed to send mgmt frame: -11
> 
> This allows validation of the firmware lockup detection and recovery
> mechanism without requiring a real hardware failure.
> 
> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.h    | 1 +
>  drivers/net/wireless/ath/ath11k/debugfs.c | 7 ++++++-
>  drivers/net/wireless/ath/ath11k/hal.c     | 7 +++++--
>  drivers/net/wireless/ath/ath11k/htc.c     | 2 +-
>  drivers/net/wireless/ath/ath11k/wmi.c     | 6 +++++-
>  5 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 221dcd23b3dd..44b02ae1e85b 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -1041,6 +1041,7 @@ struct ath11k_base {
>  	struct ath11k_dbring_cap *db_caps;
>  	u32 num_db_cap;
>  	u64 last_frame_tx_error_jiffies;
> +	bool simulate_lockup;
>  
>  	/* To synchronize 11d scan vdev id */
>  	struct mutex vdev_id_11d_lock;
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
> index 0c1138407838..ca0b72a3e0b0 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs.c
> @@ -356,7 +356,8 @@ static ssize_t ath11k_read_simulate_fw_crash(struct file *file,
>  	const char buf[] =
>  		"To simulate firmware crash write one of the keywords to this file:\n"
>  		"`assert` - this will send WMI_FORCE_FW_HANG_CMDID to firmware to cause assert.\n"
> -		"`hw-restart` - this will simply queue hw restart without fw/hw actually crashing.\n";
> +		"`hw-restart` - this will simply queue hw restart without fw/hw actually crashing.\n"
> +		"`lockup` - simulate a firmware lockup without the h/w actually hanging.\n";
>  
>  	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
>  }
> @@ -413,6 +414,10 @@ static ssize_t ath11k_write_simulate_fw_crash(struct file *file,
>  		ath11k_info(ab, "user requested hw restart\n");
>  		queue_work(ab->workqueue_aux, &ab->reset_work);
>  		ret = 0;
> +	} else if (!strcmp(buf, "lockup")) {
> +		ath11k_info(ab, "simulating lockup\n");
> +		ab->simulate_lockup = true;
> +		ret = 0;
>  	} else {
>  		ret = -EINVAL;
>  		goto exit;
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index e821e5a62c1c..e01fb17a4734 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -691,7 +691,7 @@ int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
>  
>  	tp = srng->u.dst_ring.tp;
>  
> -	if (sync_hw_ptr) {
> +	if (sync_hw_ptr && !ab->simulate_lockup) {
>  		hp = *srng->u.dst_ring.hp_addr;
>  		srng->u.dst_ring.cached_hp = hp;
>  	} else {
> @@ -743,7 +743,7 @@ u32 *ath11k_hal_srng_src_get_next_entry(struct ath11k_base *ab,
>  	 */
>  	next_hp = (srng->u.src_ring.hp + srng->entry_size) % srng->ring_size;
>  
> -	if (next_hp == srng->u.src_ring.cached_tp)
> +	if (next_hp == srng->u.src_ring.cached_tp || ab->simulate_lockup)
>  		return NULL;
>  
>  	desc = srng->ring_base_vaddr + srng->u.src_ring.hp;
> @@ -828,6 +828,9 @@ void ath11k_hal_srng_access_begin(struct ath11k_base *ab, struct hal_srng *srng)
>  
>  	lockdep_assert_held(&srng->lock);
>  
> +	if (ab->simulate_lockup)
> +		return;
> +
>  	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
>  		srng->u.src_ring.cached_tp =
>  			*(volatile u32 *)srng->u.src_ring.tp_addr;
> diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
> index 4571d01cc33d..b05d04a1f5e8 100644
> --- a/drivers/net/wireless/ath/ath11k/htc.c
> +++ b/drivers/net/wireless/ath/ath11k/htc.c
> @@ -208,7 +208,7 @@ static int ath11k_htc_process_trailer(struct ath11k_htc *htc,
>  			break;
>  		}
>  
> -		if (ab->hw_params.credit_flow) {
> +		if (ab->hw_params.credit_flow && !ab->simulate_lockup) {
>  			switch (record->hdr.id) {
>  			case ATH11K_HTC_RECORD_CREDITS:
>  				len = sizeof(struct ath11k_htc_credit_report);
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 7d9f0bcbb3b0..27d6d4a2f803 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -345,9 +345,13 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
>  
>  		if (time_in_range64(ab->last_frame_tx_error_jiffies,
>  				    range_start, jiffies_64) &&
> -		    queue_work(ab->workqueue_aux, &ab->reset_work))
> +		    queue_work(ab->workqueue_aux, &ab->reset_work)) {
>  			ath11k_err(wmi_ab->ab,
>  				   "Firmware lockup detected.  Resetting.");
> +
> +			/* Assume that reset gets us out of lockup. */
> +			ab->simulate_lockup = false;
> +		}
>  	}
>  
>  	if (ret == -ENOBUFS)
> 

My 1st impression of this patch is that the datapath folks are not going to
like the ab->simulate_lockup checks in the hot path. But I'll let the
engineers speak for themselves.

/jeff

