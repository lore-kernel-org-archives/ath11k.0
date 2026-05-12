Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29326CD343F
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 23:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iFRSuQ7UV7VaBz7cxLx0+Ht3vKhhgSju6olGQmM5Jc=; b=44nnQsTzTiTms61GZBCCbjkYmy
	T4Q9MDGiaYqVt5F483RWPQXKNz9olW3tAbwxoS/2a2A8V+ACpHQ1nnti02aJTsDHksvxS2GZ2aUAI
	niQo77Spc9GJn70ebQDCw0rnzonKerZY6p3wF5iq+XiOi79HDqAK0eKCKSlSU+1WmVmzNswzzypsd
	MNrTp3GzRZpr9iZix4qefjtSVHqi8OLJGo3YBKJ3HOhSOaS9E+Nk4y6cB/WiJm+fZuj60c2ejEBF3
	CBXNHpTQ/q98ShSZJOZiCBuvMLhCJoY9mV+OLA3ljH9ce49E3lUqLLABLYyOfD8Vgr39p2aBv4ZRs
	BrCcliOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwEY-00000000fCM-2uao;
	Tue, 12 May 2026 23:09:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwEV-00000000fBg-0ayO
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 23:09:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CLnl2v2233638
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 23:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+iFRSuQ7UV7VaBz7cxLx0+Ht3vKhhgSju6olGQmM5Jc=; b=dADzSW6UaBFuDFi5
	xO4fszBtP+/JBqYczFZbyYPP4BCAjoxSvPXD9ZmoYC9uw31mM2bi04bAAxO8yI1L
	WRww2SHi7xv0X79Ohy2KiCrMWiiESo69V2xWqvB1vRnzGIJgZqg+8JqYsei7nBfD
	L0tcMnZcKrWt2vnUSjtrpiN+YwUDgH2GEZmsZ4usdRc0NiNubTxZbB6Brn5asz+j
	LBrfA6xoxnzL92oZF8+ZdqUCHPLApvJWUxBTf22rNLkbGRa53mm7E0CP3Ax6ULUA
	Rv8KJxzuw5Ii6KOCds+Am4mW82iq/I1fplic4hDYJ1VacJFl9h7H0y8bJlSf3ZM9
	INPZOQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhtvfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 23:09:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so9858926eec.0
        for <ath11k@lists.infradead.org>; Tue, 12 May 2026 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778627383; x=1779232183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iFRSuQ7UV7VaBz7cxLx0+Ht3vKhhgSju6olGQmM5Jc=;
        b=XsDtnZ/KCszZ8+igO88Cd62Uqn3zsvxMkfAGiPewKShIZkof9D4Pvpve47NqKAKZgy
         oREuncs2ftF76rWkyod6cQCAn/1Cb0vcYDe7iJqjE1qQb4uxd/D2fUedVP6KkzHkVqpg
         QMM0WMxbb/wIQfrvdVkPP9IxKxg2G4KkwEe9uYElcRMP9hyPJ6G5X2lmfKeINTG9XtXj
         JRRRVpG4sBroCdZ0Wpy0GIkx8FycJ7hg69PzSn2OckXY5tarQLANIoyO01s40mj5bsVR
         G/glQjgQOM8jB6ZGKXR0b1LiX6t5auuWXpGqQehtbn6eA4BLLgaO9rpaSQtELeCQtd0D
         kuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627383; x=1779232183;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iFRSuQ7UV7VaBz7cxLx0+Ht3vKhhgSju6olGQmM5Jc=;
        b=r1HFc9jo0YWu1ywbPmnbC9KVV9AT/hxdODaSHljSkNJZDY8SB6kB5FH/EuQnQJvxWM
         Fs3VwgChWTgngTmUAy//E2+H/5S+/p6sR9njtayHLpKCKD1B8EYtRXMaU09dK06cgQZ5
         jgCJu6q5H17xZTDs0x+M9qvpFc/m6Yq6mq78GW9a5jgIct6ewUCeClFAbPc/20b6IkbJ
         YFQFseDSSRrCof3PqtitJEOAcwehsaASDDWFAnWmXx1EDofb3Z0tFixxmk8zq8X+vuvn
         BoYs2wPu4DFHioknewvr8P7+gULNJV8otDwMhUnLo+DTHNdVy/i1LD0+t2hT6mjmMbCS
         nYnw==
X-Forwarded-Encrypted: i=1; AFNElJ+KyMtAkqTDbVJK7i+Ash3W3+g7dlNCb77mnNDwPUYOx5tuOPUMRNkj4jBp2w8NPaMhQV9iKwQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1BfiRJ7Y+d+IqpqGLh0ooP51Z0WQ815OCjEAAE1e36fPULkzz
	bRNEJzYe+8zoLU25We/7nbScRs2tTu0f2N7b8aHDKnMYKUg5EjjpfLT+EdHM+JPXK21x+9Wvv9d
	ZW79gkPaF8/PFlh6IW0fxTkILL8NngWE/WGzWSRQmDbqwTOn/V6NV06BOS6FUmz5b
X-Gm-Gg: Acq92OGX8GYK+CdarkH2V1UKpM+eZUgBsIM0LAcrMWRuWjDI/mJQz/N9IVtmdCbRnzv
	kEQGiOyYLAtw5C8TApl+q4ezG9QMCt67p2kiw6oDyQJavvy1gvAcMs6PF7+U+w4sB6bCBKALuFf
	k/ebsl9iraiacLuR7E83a8gqasd8oE6KKW8pBPDBbRpnc8n710MMwXzbQdD07oDIxwf3MBvJ+C1
	0M1QD8yjkT/DUuP5GfMl62ORbrWEL6zlC735xPh9UBVAFTKdJNXn9HBGMxqaOM3fGQnyh/T7vn/
	YJJBydpHfjKg3VtlUUaBuhOgZQ5iJoOK+x6I78lBWocDBqEe4r/rgJf2XQdCCiiQZ3oL4Lrcj4y
	94pxfOrGhr1RnUijm7ACgsAEy7Uj/8nxiCnOh7/m4DLu3kACMBo65Oy8fIibFC9lSFL9SgGWsIc
	6GF+E2e2B5TdKZfw==
X-Received: by 2002:a05:7301:5807:b0:2d2:129a:1694 with SMTP id 5a478bee46e88-301556537d9mr140562eec.18.1778627383343;
        Tue, 12 May 2026 16:09:43 -0700 (PDT)
X-Received: by 2002:a05:7301:5807:b0:2d2:129a:1694 with SMTP id 5a478bee46e88-301556537d9mr140532eec.18.1778627382674;
        Tue, 12 May 2026 16:09:42 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm19636171eec.26.2026.05.12.16.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 16:09:42 -0700 (PDT)
Message-ID: <e9a822df-f0e1-464b-af99-c1ca315ec5cf@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND RFC 1/3] net: ath11k: fix redundant reset from
 stale pending workqueue bit
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260330-ath11k-lockup-fixes-v1-0-7ed21095c2c4@collabora.com>
 <20260330-ath11k-lockup-fixes-v1-1-7ed21095c2c4@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260330-ath11k-lockup-fixes-v1-1-7ed21095c2c4@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIzNyBTYWx0ZWRfX7f/8WXnlge8C
 b4Jurb+i273VtbulGK07lyPhCYaMGKK6ZLjpnvBgSgzjrob5CMnVbG5WuPSAzvufcRwSAslX6du
 +zXKq0Tx4RLVseWkfdSYpnoSKVt3RtEn6KG4+pBnIzEqyThkNSyVCiMAmDmYDoDWYCuHsn5WyNd
 HS6dOytjN/18fUZsLW6dS9xGJSyLeNRSzLrH6JvVEMT5DnnmTJvMx6KvzfG9lobJS5Bt258kxs1
 6kAThunaTbTfJCXAQ1ck24uxt6xeQlWJwjcKUdCvfkQbiDllZgXJP66gZ/yTA/oIn+0BL0vbsh0
 YVZ1+qH2ToG1+p1j8OYDe/EQHSP39ntOcMswSAgZ9Le8SejA1vlBBNGZ5ziedBoTghV4tbrNdYj
 Z2edsp2nU/Z7gkez2VqeWgkTtGHManjpsXERk7oYrbQ4fn6eXoGF+WwD8GHqHPy/85SrF/4Xiom
 aPmR9BxIsGL8VcRBNog==
X-Proofpoint-GUID: m76MNDiFl3TMixhHjBXkbyMLRFKAm2LH
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a03b338 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QX4gbG5DAAAA:8 a=xtXBsnOKPzI8Tx_VA0wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: m76MNDiFl3TMixhHjBXkbyMLRFKAm2LH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_160947_315564_8474D418 
X-CRM114-Status: GOOD (  23.18  )
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
> During a firmware lockup, WMI commands time out in rapid succession,
> each calling queue_work() to schedule ath11k_core_reset().  This can
> cause a spurious extra reset after recovery completes:
> 
> 1. First WMI timeout calls queue_work(), sets the pending bit and
>    schedules ath11k_core_reset(). The workqueue clears the pending bit
>    before invoking the work function. reset_count becomes 1 and the reset
>    is kicked off asynchronously. ath11k_core_reset() returns.
> 
> 2. Second WMI timeout calls queue_work() and re-queues the work. When it
>    runs after step 1 returns, it sees reset_count > 1 and blocks in
>    wait_for_completion(). The pending bit is again cleared.
> 
> 3. Third WMI timeout calls queue_work(), the pending bit was cleared in
>    step 2, so this succeeds and arms another execution.
> 
> 4. The asynchronous reset finishes. ath11k_mac_op_reconfig_complete()
>    decrements reset_count and calls complete(). The blocked worker from
>    step 2 wakes, takes the early-exit path, and decrements reset_count to
>    0.
> 
> 5. The workqueue sees the pending bit from step 3 and runs
>    ath11k_core_reset() again. reset_count is 0, triggering a
>    full redundant hardware reset.
> 
> Fix this by calling cancel_work() on reset_work in
> ath11k_mac_op_reconfig_complete() before signalling completion. This
> clears any stale pending bit, preventing the spurious re-execution.
> 
> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index e4ee2ba1f669..748f779b3d1b 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9274,6 +9274,10 @@ ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
>  			 * the recovery has to be done for each radio
>  			 */
>  			if (recovery_count == ab->num_radios) {
> +				/* Cancel any pending work, preventing a second redudant

nits:
1) networking no longer uses a different block comment style so use the
standard style where /* is on a line by itself
2: s/redudant/redundant/ (subject has it right)

but don't post a new version just for these -- wait for any other comments.
I'm pinging the development team to look at this thread.

> +				 * reset.
> +				 */
> +				cancel_work(&ab->reset_work);
>  				atomic_dec(&ab->reset_count);
>  				complete(&ab->reset_complete);
>  				ab->is_reset = false;
> 


