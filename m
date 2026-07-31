Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327F1C55172
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 08:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuohLgv2ewEMxWehRE3OJp4yXClrJcRe5nvz3u5mbkw=; b=ekRSM0WbxIYAxscmOCbkR+Uk/+
	UMvS6FODO/uI4Rq41EN3Hsitx1gj+ZAZhpkPuTG60upJ04E+3nNZSru3f8bT805M1kpnNwkjNcFSv
	8PqX6CbTbgM4RGHcd69I0hRSGM/0XiFQYoqBVKqdqAWBULkkmTDJ/wkkHR0v/whBh37c7wb4J8GZO
	M9flEx4gzidpgk+hpBJSQ4lFcXqax8tQMQH63WqC49PApi1oK+/dS9Q65XiyMzvfzWTo+5vzNrFJQ
	X8LkgEoeZ09cL/r83SAjehw8Hpketx0Az4VqH5owZaDQd888MkOVQi4ArOW6R0bPUVCERhl7+U15x
	QOb6Gneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpivK-0000000C6lY-0vdr;
	Fri, 31 Jul 2026 08:48:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpivG-0000000C6jp-04JT
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 08:48:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8mreX3993466
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuohLgv2ewEMxWehRE3OJp4yXClrJcRe5nvz3u5mbkw=; b=GCupiym08Ro3L1vA
	y+aaawzkdT4YtUjsdKw//xK+zyCA1AkSObg0w9XN0wUNmMEWDQP9/oZDf0iJ1Cuy
	Zn4Yx7QtqnUrgR5giYckvAUAQ4NAQoAgrQylpScr/AVP98+iqDOa+XcLo4J1/czG
	kYbLxI6lyXXRnlF1n0/GHQEdcnnqgjoTTBsTLpMs3GvzeqaoO3sRXIY4UUZk73OT
	q7j5niPs8vMk//XFItZKxz9+ltNe3QQU9bNw3yCbCBVVcCmoj5qLEfv6hFt1Bz+E
	pMiJBaE6aXuz2MZ6mYH54QIg2whu3932+YubrUCfNDhSSfqNQgVaBCwkNgedNS7n
	mATsdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrhar00k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso10804405ad.3
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487733; x=1786092533; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YuohLgv2ewEMxWehRE3OJp4yXClrJcRe5nvz3u5mbkw=;
        b=KQ8zgJIDuHDRiy7O3/oVtNDrhIQvvCLKllo7HMlpaUrzqAGqQ6xXSem3PkbW7tRr4S
         Ck/5fVYwmihOXJujKACi3aIbnRtBDLs3kKa1qBPL5lyM3UA9vf4d+//4VTR61Qh6RZNY
         fZOU/Is70/3v4cBVUmrrJlsnQVw1x3vcyFCZ3MTWcizhnOcCER/k6ptu/M5bQkpam/TM
         OS6r6ZwH9aPyieItDKRmxswuPLGQuzcKkH8uyjXnvmATnrjYMtL26IqrMOoVb7pTPiRh
         kN16WCiumVLcVUqNMthOkJLUJkpR0hpDpvg1lyBF+8uPwP6nf3UUavZ42ziXzoyq6n88
         LNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487733; x=1786092533;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuohLgv2ewEMxWehRE3OJp4yXClrJcRe5nvz3u5mbkw=;
        b=SVczNkseDe0E2Btk7Gh96KePyJ2d1sMf6yz+2kR9Dv11NkMSrDTzTuf3uv/+73S3Ky
         tB7a5D3Ubfq36eKQGzOq8svRlEqu7J/9110aC1bYqgHWiEY83isVtOQuFlr0zhFmLP5l
         4gdY3mhzUZFBPOpOgu7dh4IYX1pxDgkxfm0Yv1VLACFPxyvmDkOjaojgclxTCjNb49qA
         9oF8JAsqLdVlwAW8qhOlukC2zkpdiEbySmUK3QwZ34YPZnOeR1wf1LB6IrlqhjC0biOZ
         fLUv41/rtgNdwn7ugbZWFSWWZxrfhAuVyP50p/zCjy12NbJ/KHOYyD2JTM2gn9eDvA6H
         EClQ==
X-Gm-Message-State: AOJu0YxbTnT5bCQk1XVqQqWbn9hBbSkCaRqhkRtpbGvoiLNZsEQOJH4I
	iqhFMqYdPr8jNrCC3g7N6Th2eUFgZRKIIiRErB/4BO0nLfOIYPsjpzYYnFi4O2lDx5SKISFT2TI
	hyY8sKlqxrHrU3X/6cy8/mlXxanulHvyV5muIxQY3dGQtijikj1g+6RXi64ZDH2Xo
X-Gm-Gg: AR+sD11bGAQV2voV1+zZPnylwBMANnaTaFhfZaFdAod2g7hbCk2s8rOpciA8IQtkIQw
	q59t7yfuKkFvKAKV+yA13iI3neVar5l3gHrELjXxpcItiFpLrqIksR/yCS6xnHgLfbIoRBUMzQ3
	wfsvpO5/B93d1e4c5pFiy5z47jT95/av9/y603NEjpEg0iKfMhBeUxKjNXVOXLaDW7fvjz7G9+X
	QZ1bwzMeRWAYLokbXPIiLw1uREWUvrOlx3JNCrKoc61xPel4207BQfAEQt3XVD4lQJ4IRLBxDxr
	dZVAyIoE8TiZx5XKTRYzBf03PDYK76SUn1Ru+9fkl8aXKz2vDXnW6JIVx5kO9lyXJJS7FHIrisE
	OLKcWrc0KVZPiiYbRJAwfpPUcTCJ5jk/mPc+y1cSDLFdwo3c7AZTPFJMP7hX5Jcv/5B7h7uFKlA
	==
X-Received: by 2002:a17:903:2f4c:b0:2be:3850:297e with SMTP id d9443c01a7336-2d046e7db1emr13839485ad.31.1785487732777;
        Fri, 31 Jul 2026 01:48:52 -0700 (PDT)
X-Received: by 2002:a17:903:2f4c:b0:2be:3850:297e with SMTP id d9443c01a7336-2d046e7db1emr13839105ad.31.1785487732202;
        Fri, 31 Jul 2026 01:48:52 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae68cf7sm2700115ad.31.2026.07.31.01.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:48:51 -0700 (PDT)
Message-ID: <1f80cdf0-2ca8-4b28-9192-b42bd61abff1@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:48:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] wifi: ath12k: skip connection_loss_work for MLO
 beacon miss
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
 <20260727162748.963275-6-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727162748.963275-6-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bJtKXQoKm8I-Naqw6d130vNhuJdR8I3z
X-Proofpoint-GUID: bJtKXQoKm8I-Naqw6d130vNhuJdR8I3z
X-Authority-Analysis: v=2.4 cv=DvdmPm/+ c=1 sm=1 tr=0 ts=6a6c6175 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=Mojy9TJRF7p0t743WAkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX+L8BMiY1roCA
 FqwvzGrLtZD62egBc3csd+nA7tgtYcUdZ9KoJ+iAPKnX5M8a8Y+hg5pyez2qKA7bjo5lS59bXar
 K/rMElYD/Ka0gU0qD3P7tTxj7q68FUDgHiXckO/WOuJ0HZGVyWXQPr+5wYqxq5lbcwcdIKRZl9u
 lyOQIBMBFA74BtpteJJY2NelX2cYx6x6hbv6UMdyb0ir8joBJjfqUySynevFTJ7ylYSNSQdIfes
 jfWII0KU8DBZdmci/63i+iPLzHX+pv0fmmzfmvqPOC9AHiOR7K5XgkVXwY2a+pRwv9WjeWILsic
 GOOU/8eLTaMDCvkIdK9xrZ23aoEmvV6KMkm5T2woelEFJGt/pqmpCulXsLFBu5NupeARUS5GOIh
 Q/eOCwi95NUVJ46bAttYC0Ji0OCNZk/RfWCNgcH9XjS1mRw5I3dod78X2EaLTyCqtSzfHcZQRLk
 CmnuL8WeUOrYZvQwmhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfXyIAi44bHgcu6
 ewjhA6pgUhc3w/kKPL1x2d5w9aOJpAgk5GnMhzCvdwMQtD97pgzC9AyoT3gCMIHlABGA20wvxdZ
 vTubCB8LRPhfnYFgoKCaSgrr+/ZF4Lg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_014854_060137_845BFA3A 
X-CRM114-Status: GOOD (  20.18  )
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



On 7/28/2026 12:27 AM, Jose Ignacio Tornos Martinez wrote:
> When firmware reports a beacon miss, ath12k queues connection_loss_work
> as a 3-second backup timer that forces a full VIF disconnect via
> ieee80211_connection_loss(). This work can only be cancelled when a
> beacon frame arrives through WMI in ath12k_mac_handle_beacon_iter().
> 
> In MLO, this mechanism causes periodic spurious disconnections because
> the firmware does not reliably forward beacon frames to the host via
> WMI, making the cancellation path ineffective. The result is a full
> VIF disconnect every ~16 seconds during normal MLO operation, easily
> reproducible under heavy traffic.
> 
> Skip queueing connection_loss_work for MLO VIFs. The mac80211 AP probe
> triggered by ieee80211_beacon_loss() is sufficient to detect real AP
> unreachability. Other MLO-capable drivers such as mt76 and rtw89
> similarly rely on ieee80211_beacon_loss() without adding a backup
> disconnect timer.
> 
> Tested on WCN7850 with MLO (Wi-Fi 7).
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index af09153ad9d9..dfd69822c5ce 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -2008,9 +2008,16 @@ void ath12k_mac_handle_beacon_miss(struct ath12k *ar,
>  	 * (done by mac80211) succeeds but beacons do not resume then it
>  	 * doesn't make sense to continue operation. Queue connection loss work
>  	 * which can be cancelled when beacon is received.
> +	 *
> +	 * Skip for MLO because connection_loss_work disconnects the entire
> +	 * VIF based on a single link's beacon miss, and its cancellation
> +	 * mechanism (beacon reception via WMI) is unreliable. The mac80211
> +	 * probe triggered by ieee80211_beacon_loss() above is sufficient
> +	 * to detect real AP unreachability.
>  	 */
> -	ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
> -				     ATH12K_CONNECTION_LOSS_HZ);
> +	if (!ieee80211_vif_is_mld(vif))
> +		ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
> +					     ATH12K_CONNECTION_LOSS_HZ);

with this, patch 4/5's MLO branch is never reachable

>  }
>  
>  static void ath12k_mac_vif_sta_connection_loss_work(struct work_struct *work)


