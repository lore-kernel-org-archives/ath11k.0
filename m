Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BAE606A31C
	for <ath11k@archiver.kernel.org>; Mon, 16 Nov 2026 05:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=usGPjDKz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GHGTUjCN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZsHIUGBe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iE0mHKgasYDQXqOjSQmcbbi3SGf+QqcYTFBYQBjetIY=; b=usGPjDKz4FtXH9
	WVRD6ivB4J/n8WAiW0DrNuurGDGwyZYF0i04M45OMHpgd/1SC3TYrcZM1pgIiFGqY7RXqRnSm6pah
	QZqE29riFeK0mFj2MGTYv1hFIyAsv3RE1UIIAZGy5pdTB4Cz64xIz0mYcU7do8JDGuyZvXvG3/H8z
	z2D8tGr7Z4otDZUJybVuU/IDyP2rAFd3UArwhYrwoOWJf0YFmTRGsv+mTb+kZGPbOrX5zNntMx05c
	leW9YzuxpdaXQy2fcazEtEjUJLG4RcbGPLjnmdi+tJbe81W64sIwpDwa+7se2nJsN+9+GAOWuUjtQ
	esiuzJHqxqWpgKgMgnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSp5E-00000001A0e-2PMs;
	Mon, 16 Nov 2026 05:16:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSp5C-00000001A02-21YY
	for ath11k@lists.infradead.org;
	Mon, 16 Nov 2026 05:16:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG4R5hn203959
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 05:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iE0mHKgasYDQXqOjSQmcbbi3SGf+QqcYTFBYQBjetIY=; b=GHGTUjCNVF6XFXEp
	q4Tjn64ueYx904I8v7i2aGnmzhhBDWIvc7gHlTh7HZ3TaSTmAaLzdsDqGrIkRve3
	4uI3XjZ9O99lIiF0CpqsTkA/4IAMDnBlX7BQO8RzYcyrhj1cAaSDHyY2hs2cMK8S
	wr9aVGvmuNdDD6wRcGRv81z2l+lKwUPmpdDQDY5JpEnf7jiAQ7IvRh9r+s1nLdEP
	fnnI7rVKRxyX/zzStPeNr/8edzBGayqFlrqQXL9S2gD8KdYaKDKTMcCYZMPQfiMh
	8d0ZC8rqkG4a36M3Hxba3Cif22G0wJqdXDHOxETDlE3w+qh4nHQV8YvAHaslEIK1
	g5F1Rg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx4y92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 05:16:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so2505790a91.0
        for <ath11k@lists.infradead.org>; Sun, 15 Nov 2026 21:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806204; x=1795411004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iE0mHKgasYDQXqOjSQmcbbi3SGf+QqcYTFBYQBjetIY=;
        b=ZsHIUGBe8tIj5Sax2HRwBY+N8oKXvcgDjfF8MIYRqzQ31IXP292dfMlyjXNrk8GBEp
         2lXG+Z9a88PCAkv11UCNkOQS6uY2bTZWD0vFIHE7eyuUwPypXp8nXOSAq0kJk4RzapID
         G/UmwxsPbQAVkMDMHDwhO1/mChoFc+BQZVM/Rl4Y/8+iVvK8KWP6/SIqSwpyMzsPEUmZ
         HFUfLP3cxXXQNDpoY8Y2/BGfsqciOYAHft5bVcsJi3xQNxOYS+BsLLFMyqN4nJWoEMZJ
         hwNNlyVLOKoenaktkKgBN9h8sD9cpytQZvXTgAIctR7cpwTFsbpG0HmT5JI38sq3fDvM
         +nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806204; x=1795411004;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE0mHKgasYDQXqOjSQmcbbi3SGf+QqcYTFBYQBjetIY=;
        b=gghAEQba4J3XbtxWBJlN6NStz1ADPR8XNT10JeFyDOGLQgqOllU8uqZxVzBDiP2tcs
         c20YUXRGpYDaiTnAbMlryn1o82Lxi2lemRuvwaxuVH/oEzwSjEJY/fs/4KepYyVKStwx
         0m2lwzU66rqW18VA0XD9WirmE/w5hHXZodrT/V3SByLeTQ10OLts5osLGe7CtJuZSBSb
         47ZKaGfkj860jjnCO5e8vtqRWjqH+ChGSazk8lgXYDz4BPy6R1UXJvSpWGjNHrobhA9G
         BPUadqJmU8CYueHR/v/sl2Kocym2DiWkiFy8oRgBSi9qyoXrHBHNx1d2TjRt5gj+dagI
         xwUQ==
X-Forwarded-Encrypted: i=1; AL+hErEsNGTGIxIKCv0LP1Y8jBmIvo+4BRjPQnQnXOCZLqJKsZH1zTAduQVN05f9w/gmAnnkfRjMT1Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z+IIfbATSRBMovMPaFCEHWhkMpNZi1tj7c59fzD7+19xcpTkzqe
	KkVn+wC6XU3h83YqUj6XUzq+rwLpsbR17N1PfdY+QyfevEoK+OQInFlsDjvvkOA9elNmANZYiLg
	SzEktubytWb1WD7WIxp3VL+ywVVqj+Om21OWMGX0Q6N2v0oSC45GMet7/EWNFPaEI
X-Gm-Gg: AYBFou0tvBFM801Z9oq+BcmdQgRM6osN63+U7zaVIt9yI0rDnb4Og7b3tzCpTyezyFn
	vv1eqYfQJSQe3utXelq9g0Pbo3S9JS6+f/9qZ5IHtfKCzS/I6tF/BtiOBvwD4DtGE7asFvTZL6t
	fOBuVFk1Ju6lEz0lX+hIeuop58PcqCZpRqkpb6xNWUArlaNIDERBqdF8J2ZXsWdi1wUpbEqqoD5
	Ofw3U+L7jyW7/NSzzCUHzz4539eS6re/vKcRCKfLRR018wrL9mFL4uzoPny7MtX1yLYeMnmFhNE
	zyDQv9HAjzvdrKUbj2YNVArQ7el6vxD9tIfDgzQ26+qbo0cHL04WJmlFaMRYmvt4GzhbxjvoLKZ
	XJen93Jm+R+bJuXz1stkVwVT/BCHuoA01LHn1+Z4D8BmGRbTZ55Dh07uWmFi/bmzXIEXeURx6OH
	4dV2mOWic+LPiPPOi6QxkLLd/EO+vwZIXt4uWnqQTx/to3sg==
X-Received: by 2002:a17:90b:3146:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3b1b0a42b59mr9391068a91.10.1794806203943;
        Sun, 15 Nov 2026 21:16:43 -0800 (PST)
X-Received: by 2002:a17:90b:3146:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3b1b0a42b59mr9391051a91.10.1794806203367;
        Sun, 15 Nov 2026 21:16:43 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm14582152a91.10.2026.11.15.21.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 21:16:42 -0800 (PST)
Message-ID: <8afb80bf-5f96-4a1a-b1cc-09f6ea77d939@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 13:16:39 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: WCN6855 on Lenovo (17aa:9309) uses generic regdb, 5 GHz
 passive-only
To: alexiscalin <alexiscalin@protonmail.com>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <uiDP3AfIPxylorMgOmrrT94taa0jYfo5VPw94l4YkKyGPD0X7byxDKdEF4LFqv6ltBlbS2atFSQT7PgJORjH30HU8wOK4uS3DhyacPPuT9k=@protonmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <uiDP3AfIPxylorMgOmrrT94taa0jYfo5VPw94l4YkKyGPD0X7byxDKdEF4LFqv6ltBlbS2atFSQT7PgJORjH30HU8wOK4uS3DhyacPPuT9k=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMCBTYWx0ZWRfXwrA65p5X37NG
 Aqx1ymQmesBDgRtJUSvojiaHAKJMehAsKuTXjkrzuj0/2A1SQAsWGu4LnEfsOJH93EEyYad3hFZ
 cbkJMbuUzoSWSIWq+iC7fhGalBTwXjVofweoAtY1d3NhZiPJes8+/bvDoZo0EcATkdTIkt09U5W
 McZGbrZ4O+9ZpN1tcBs2n9RLdgEVH2QXrfqoEYfWF0d3g8K5exx0w/raU/NOqbciySHpfaq6noe
 +GdN/goaEECwuU61zCjEFgy04YRBiETb32voP/ZAu8O8uvdwuEb6lLqmPYEDu3CzeLrD8GRmrE6
 gKaOA0bzwNGGDOltTsrHAlZ+BgMI3UiwPc4EH4IUfNtGDDMfNlUnDWSa42t8bzwM6MEguqbYuRg
 s3+9km56ENVgPmAOdUP/ZZd0D+1gGGT1znAW2lfroE2WEcNXX4m5PAwuy0/91mCUQ3xC5Hvpgpi
 lmUaGqS4cAuUAet6UIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMCBTYWx0ZWRfXztiUb2zssY5X
 rahUVI4LOormgkIgUXXpCy35Hqlst8v4YQXW9uCmaYNzMCb7AAROwPbCS1mtxyhAAP+GP83iwpt
 7zfs4W7sDibut0t4P6aEkbF/AcUS2BU=
X-Proofpoint-ORIG-GUID: z1gE084HyFhgs5vpQu3zfk00GSFDwNZt
X-Proofpoint-GUID: z1gE084HyFhgs5vpQu3zfk00GSFDwNZt
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa91bd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=JeqzCeE8Fiu7eYIaxEEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_211646_658360_7E736FC2 
X-CRM114-Status: GOOD (  16.30  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/15/2026 9:16 PM, alexiscalin wrote:
> Hardware: ThinkPad P14s Gen 5 AMD (21ME), Qualcomm QCNFA765 / WCN6855
> hw2.1 [17cb:1103], subsystem 17aa:9309, chip_id 0x12, board_id 0xff.
> Firmware: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> board-2.bin: atheros-firmware-20261019 (Fedora 44)
> Kernel: 7.2.13 (ath11k identical to v7.2.13)
> 
> ath11k finds the board data for the Lenovo variant (SMBIOS type 0xf8
> "LE"):
> 
>   boot found board data for 'bus=pci,vendor=17cb,device=1103,
>   subsystem-vendor=17aa,subsystem-device=9309,qmi-chip-id=18,
>   qmi-board-id=255,variant=LE'
> 
> but there is no regdb for it, so it falls back to the generic one:
> 
>   boot failed to fetch regdb data for bus=pci,vendor=17cb,device=1103,
>   subsystem-vendor=17aa,subsystem-device=9309,qmi-chip-id=18,
>   qmi-board-id=255,variant=LE from ath11k/WCN6855/hw2.1/board-2.bin
>   boot found match regdb data for name 'bus=pci'
> 
> board-2.bin has 16 board entries for Lenovo (subsystem-device 9308,
> 9309, 930a and e0be) but no Lenovo regdb entry. Its 35 regdb entries are
> the generic 'bus=pci' one and 34 for HP (subsystem-vendor 105b).
> 
> With the generic regdb, the firmware's default country is BR, and every
> 5 GHz rule it reports has REGULATORY_CHAN_NO_IR (FLAGS 2), also after
> 11d has switched the country to US or FR:
> 
>   wmi cc_ext BR dfs 0 ...
>   wmi reg rule 1: (5170 - 5330 @ 160) (0, 20) (FLAGS 2)
>   wmi reg rule 2: (5490 - 5730 @ 160) (0, 20) (FLAGS 2)
>   wmi reg rule 3: (5735 - 5895 @ 160) (0, 20) (FLAGS 2)
> 
> So all 28 5 GHz channels are scanned passively, including the non-DFS
> ones. For FR, wireless-regdb (iw reg get, global) has no NO-IR on these
> ranges, but the device reports:
> 
>   global: (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>           (5725 - 5875 @ 80), (N/A, 13), (N/A)
>   phy:    (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>           (5735 - 5855 @ 80), (N/A, 14), (N/A), AUTO-BW, PASSIVE-SCAN
> 
> A full scan takes about 5 s, of which the 28 passive 5 GHz channels at a
> 150 ms dwell time account for about 4.2 s. This delays every connection
> that needs a scan, e.g., Wi-Fi after resume: with NetworkManager, Wi-Fi
> is back 6.6-7.7 s after the wake-up alarm. For comparison, an Intel 8265
> laptop measured the same way takes 5.4-5.5 s. (An additional scan done
> by wpa_supplicant after resume, which made it 12.6-12.7 s, is a separate
> wpa_supplicant issue and has been reported on the hostap list:
> "wpa_supplicant: Initialize is_6ghz_enabled when adding an interface".)
> 
> Could a regdb for the Lenovo WCN6855 variants be added to board-2.bin,
> as was done for HP? I can test a candidate file on this machine.
> 

likely same to [1], which, sadly, still has not got resolved. I will ask firmware team to
speed up.

[1]
https://lore.kernel.org/ath11k/CALOnm7APGpVWcx45O78fa4hOCUGDc0-ywGoqicr51YtpxNueLg@mail.gmail.com/

