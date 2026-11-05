Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE740606A31B
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 20:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eAEEj2s1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3rtgOhS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TLCbN+nz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=; b=eAEEj2s1rLbJ8b
	Kv6E3p8MfFY57Ie+6LkcAdjwVkJ4MA2DtaIOM8v5z4dP3q0IOE8gKXwB/HD7p9nRn8VuMNqOLMHyF
	SmL0eBGmo+hy3FyYY4pf+5s5g68MCNm7qyboyrdwN5CxXmua0VCrT7Bnvmpj3gr2J1Uw8RzrgbxPT
	BXkh0aQHK1u/zJ3FDAzfIwY5gCdWdVtvVBicjZ0GlpNxJdtTYOKvE7CwXBMpduwZ0lWSC78jHDzr6
	1G9no2twVH1jYSUC0EdyK7um5SLikMR/Y1pSS2B+sIOVZ+X56CeA8qelM68NDdc3nkUIPda+tOnhz
	EouRjzqMJh4SJfd2DLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Sx-0000000Adl7-1f9K;
	Thu, 05 Nov 2026 20:53:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Sk-0000000Adfe-35vH
	for ath11k@lists.infradead.org;
	Thu, 05 Nov 2026 20:53:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeMxA1440026
	for <ath11k@lists.infradead.org>; Thu, 5 Nov 2026 20:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=; b=M3rtgOhSCcj95UjP
	3/j4z5tdBB2n0bGDiKdqXcsrLqnbIpEvXe7ytaOgEsqBtRaCIB5Q+9qoFlKPhxaY
	TigGajnv7BOLByYV+yFakkTo8hzBZGH3ptefucT9IVDby60awSQE2RMFPU9ti+Nc
	+CNEsOWYOQqmSfBgKDhCSRP45oet2N4myk31oBxRca8evzE0D5J6mIURKqNHNe/1
	6wY3k0rUy3jammAdM3kDUwflelcxKxdOuKcW49xP54FGl5hvA6j5SajDDaUUYUvn
	3goc1QpDL+qWi47208V1SV+N3YIUp7XcBIGgXOZZoN1ac0CbIq0OFgKHYS+uRjoG
	A59I4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v3sd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 20:53:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so420232785a.0
        for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 12:53:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912012; cv=none;
        d=google.com; s=arc-20260327;
        b=DMA0PefVIl6JY8U6OpTbhJZ5G0VVCrnS334FGY23jEUMAwkVNUIcWZAWKiCCBr84WC
         /E1fkENemHGP/k+ROKsYij0EJLypw1MEpChxtaDEZ5d5KsGZkzxAJQCD+XGKUmcuimMP
         LC0aifbQgmt80905jXKsshrwWzQgLBxRs7YOMXs6+DMPd6kSknjPfS7JpE+bIAGuDY03
         F6eQDOn2JqHBUuiyKKsYyEvhO0sNv5vBdB9mQNHOXS6s76+Le3tS1LFInFbSzP00w5ak
         zHkdpLVEkNEOdwZllDTQrhqClJg92wNaS3zdPc5KpdQmxZWb0yJ8LtmlMzZ6hZCibvYf
         2MBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
        fh=kGd6JYbaAGxKV3CSzFRPZk3ZVBi/6Yf8OHcQdNWeVkY=;
        b=sz77YjzeUziTCh6hSbmTZJS3GdzbJ32c67M/53bk7doHRbhAqiyvPQGKxDhh8M6ijL
         v9ee6pYJXkJ/YvooT1BwusOfZCgjYxvMwXuhbjGNwcMHjDyLVaeZwgonTASMjb56HhXl
         4OoOXaJjApTluPSuq43TqJo26ejK7ILdQ07734gxqktdMCfVDRUQ/CFAXZScpPBxDQ7b
         pEDVT1uQtZ4xfFc70eg3zmGx05pmSNQ4I806tWGqSYrAJZDHlD6HZvXKO/jW+g5GJGQY
         xQVUz1xjRuW9OLSSybRqfHfRR2lch9DWutyu1fYizTIPhoG6Sa4umv0m1wWZfqVfmM4g
         /v+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793912012; x=1794516812; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
        b=TLCbN+nzUeBQ65rdGROFQZ5D0dzcivxPi8Wv5ayERiUGkzlSY4X3Fex1H2RJ2DUhCn
         9WG1FUE7rHjUHk5F3PuYMeao2gE0oyumoVE63TfDWaF0rqsIShduI1hzRHzvcQ+b/wSW
         RqJSbvx4VkTAM7h5iMa7J8W7ClwZDDqyoTHApEeVUDQfuRGcLeV059u07/kvwhidL41V
         PIHdlmxGa2pEKzFlMx5NzlEMyjdPKcF2MuXWAShoNugUTXto9GIzzwOlMVdzy+hNhCUB
         vkqfrOnPGzDRDenFgafq4FTSS3aJD9nmkThUBJr1TOLCTghU7MUQuSZiYL1CP1GlcWXo
         g4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912012; x=1794516812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
        b=rOHZp58Vt18BHfp18WSj3UewXpcclhDix9etoiL/8NGPQANO5cOJF50wEGsLgkKUtn
         LxGxhXE1apX4OMimdtYELLu9yl3+0+ty46zksHGVWxNW7FxH9BUg+TR1dnTBHFB/SCfH
         sIfF4Si8LqE+hI0HTwn8dBX5hg1I1z+Yc7IYUPCtzSZrVd4KQ/fz7iZfIx1u7CUXvOtp
         5v5+RJk1dnw2h4Asv1stHStNdinJpiPYzVvVTFddgnQla2y3/RCGOZWTUxmN00tsk16N
         DUD3IdXQsWp5qDXt9GFZE5aElTijd8A07ukIdGGyORwkUvhpcTHPKTShvnbUUSOrSi23
         OH5w==
X-Forwarded-Encrypted: i=1; AKwUvBzJR8Z+EB2s2jTm95XpFKZ7719EXmjtoWbJHevp4MF15DXdwZWPPfpOsTFQLh8lc/6IKWrfnrc=@lists.infradead.org
X-Gm-Message-State: APuU4Z+3zrmY/ieCcsCtGpmmON+O7ts/qcDv6myynwq88kKAc0JoJTNF
	E0VWmrTZ3+dAzihBn7zZwwqKofSspVk/mfSAUXLXoG8ZUePtxut59WdNVD7pFpYhys9zVyuw5fg
	0LZSv4IRCn+PJf/hPZjzaGtP9RhKpQNER46gkUj/a+QRbNVIfoRxvfoK8IIFnl44P1/Up2DTU65
	oqq10Czl1TNSGkFH6Fmt432fX3Mgru91PqXCjTh+A=
X-Gm-Gg: AYBFou0yGdQ6q+jXlPG/UzRXQGp3SwhRkGA+ma1lBn8GVpom5WhAQATnAv8jcTn1qxF
	rkpb+jVwBenwh6nNx8RYov0R9fWEJ6XS6wWNyoIW8qmZJAHAvAbthNUd9VhteFL8KMhQj25rKg4
	q0Fxlvlj7FBTnFis9RbWPx4XbvaCKSSgSWeOV2wQ7SueNhDnY5LXjMf1wIqS9Azrn9RqK78PPX3
	5nHxhcvcRqnIncmRwtdOsLF5CkTeF+h9r5fhLIuKL5M3EC0Dnf0qwwd+/q0VNdzk+CU+Lag7R8=
X-Received: by 2002:a05:620a:2842:b0:93f:1936:b206 with SMTP id af79cd13be357-945f360a793mr39836285a.83.1793912012186;
        Thu, 05 Nov 2026 12:53:32 -0800 (PST)
X-Received: by 2002:a05:620a:2842:b0:93f:1936:b206 with SMTP id
 af79cd13be357-945f360a793mr39833985a.83.1793912011754; Thu, 05 Nov 2026
 12:53:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com> <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
In-Reply-To: <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 21:53:20 +0100
X-Gm-Features: AclHuK8M2UGEAgtgAaYS4CJiDcLNJz8p_a_dG3tur9BUocLC8UmA9Ko567IQDlQ
Message-ID: <CAFEp6-0O=cPYKndr9hen1jvX==ot2WP4JpGfNFLokVvxUEbxiw@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
To: christophergriffin05@gmail.com
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Hari Chandrakanthan <quic_haric@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        John Crispin <john@phrozen.org>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        ath10k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX7Qi8By/pO4V1
 m9sZqJhbKWQdcj5WK+KOdIi6MkMBADk5oQOcJANioGPPzk2B6/QlrlHpqocSswxIUIPIpqJTCbN
 VQoSc9uNZT7i+DCB4vxScOJVC47CZ6Q=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aececcd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=CkqNy8FowFOMXlqwbJ0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX3HrJ5VO/xASa
 oHFY2oaDKA3QI48GeLooWoK229wWXJ8S2RNfQw5yUYwnSfVBSzkLqu2pib5kqWGdLdLLcbU9e1s
 rrJfp04s/UT8eWOjcij3mKvJDbtbu2CoCzuCbsDZVdraZ35VMnKi7gfcDXfwQ7ixWYmAp3GbmB3
 74NaNlp3iGyMBtYzRbcaZk11Q/9yLklDAWNp/xlK72ZMqKks05kdC45L4NtfzAWN4Zxiui3fjxA
 w5WHF/yN/ImsInr85ZIjzKMRmjdN2OVRaTACwzWlqQaK4XH+ye2Wsrkoq3QRg36ZKdNAGgmd2Ri
 eBnCQ8cMWW2PhBfD5ykWPeeius5ydzBmOvh6Y003BkN7jHE0n8/DtoRIS5/MOnR1+BUit3f9X8S
 1/n18tK5tr0mllHvygKocHgjyzd5G3emJKEZQnLCUefj1JPVmexx1Tv375Azcuzi8PLONHz5LBB
 vdFXdTNsXpLMfVy8WMw==
X-Proofpoint-GUID: GPVX7MyesFghOfwDGXv8NFU1owc0H8wR
X-Proofpoint-ORIG-GUID: GPVX7MyesFghOfwDGXv8NFU1owc0H8wR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_125334_854901_E4DCCE64 
X-CRM114-Status: GOOD (  21.17  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 7:11=E2=80=AFPM Christopher Griffin via B4 Relay
<devnull+christophergriffin05.gmail.com@kernel.org> wrote:
>
> From: Christopher Griffin <christophergriffin05@gmail.com>
>
> When ath10k_start_scan() fails, ath10k_hw_scan() sets the scan state
> back to idle and returns the error to mac80211, but first still queues
> ar->scan.timeout. The timeout then stays pending for the full scan time
> (20 s by default) although no scan is running. A scan started within
> that time gets no timeout of its own, as the work is already pending,
> and the stale one aborts it early.
>
> Don't queue the timeout when the scan did not start, as
> ath10k_remain_on_channel() already does. Until commit 634349bae0b2
> ("ath10k: move hw_scan worker queuing") ath10k_start_scan() queued it,
> on success only.
>
> ath11k has the same code; there, a QCN9074 firmware crash during a scan
> left such a timeout pending.
>
> Fixes: 634349bae0b2 ("ath10k: move hw_scan worker queuing")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>

It looks more like a theoretical issue than something that is likely
to occur in practice, but the fix looks good to me.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c20..2fded15b61721 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6491,6 +6491,7 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
>                 spin_lock_bh(&ar->data_lock);
>                 ar->scan.state =3D ATH10K_SCAN_IDLE;
>                 spin_unlock_bh(&ar->data_lock);
> +               goto exit;
>         }
>
>         ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
>
> --
> 2.43.0
>
>

