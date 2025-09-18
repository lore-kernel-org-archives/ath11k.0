Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D5BCAC59A
	for <ath11k@archiver.kernel.org>; Thu, 18 Sep 2025 16:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qICgYr9pTII0ek2CGvjEE+bggBezqbDRv5s7Qp5blPE=; b=ScWehH4F3c6M1pP0Tx1cjhanrn
	kXSyJSQIr8vI4vRaKZ2S1EhpJdOxTzqAVPwvbO2+jlSY5QVaA3lhy48+4B+/PUQFKz9tyZJ7w0/bD
	pYPv3RwcgH9VlfvKLjBPqM37Xsj/en6ZT8Kg43Gw8btBFOjjOQ+z5ind0dAYwIPNLMGDFMxoera95
	iSYlxV6+equ3/aSeeuX9AJtzRhDc3LabhhHsmRDeerf42mzYiAOocfEJAvzc6gn47dt00R8/E2Yv4
	mKAuL+Gl/pjlcw76eaACRRc3WjYGYM/jsz/uMaOXsk+Q1HLI1XR6K+dqRkv6DkTZRq/HhvfWrXvtY
	vMQCIXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHAz-00000000Yx0-0XAw;
	Thu, 18 Sep 2025 16:08:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHAw-00000000Yvp-3BNB
	for ath11k@lists.infradead.org;
	Thu, 18 Sep 2025 16:08:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IFFkck007166
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 16:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qICgYr9pTII0ek2CGvjEE+bggBezqbDRv5s7Qp5blPE=; b=lWsuGhjAfPcG/dFC
	Y2QGOArgYjmDWw6zhISUE9kj6glVXlRkLr0c2dEETQaj0qomW3jv0q7FWy0wSpe9
	xzTbnxKh/afGiDyXNK6n+08US6G4exQLze3YYujrOy77jJU29WuNyHGCmmNMxht0
	OFgLCZC2oDsp12R8t1aF4gkYITBDAQeXs0hCTJudgdVucamdYQRf2/5sfGTbrzq7
	4rEoQoWCI9ESbDs+95OfVe5ZEV1Ip0jFgoD1wfNrOy/9wWOPoXgrJ/kRHHoDlB5X
	u0iTdscOHdx2WlfPkS7YblTfLoBxejS0rqN0BDqxM4Zb9DFaTK3KFuGuA7kTOXUi
	hMZEZw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebesjph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 16:08:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77c5a0c19d4so1488337b3a.3
        for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 09:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758211680; x=1758816480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qICgYr9pTII0ek2CGvjEE+bggBezqbDRv5s7Qp5blPE=;
        b=VfozhNDskeK+fmUw8RCsLlZ+2y8b7LPoMFz2RhuO7b2NfkR2asSOO3OokDvVG6oBCp
         bO4tjd7/LoYn5wZpCWhKVRuDxWTYn0JAc5b97l6rzJWWBg6UgcCchMfTEQeJfZWNqTQo
         bOXbw5MSlnFxUQAE23IHQd9PL60Nz8+dpXcf8QSBLZn1Ak64fH9YI9QFnmaBKkaDhKv7
         c5YBJNnNT8KePBx7LCjUrpl1cYN7kzofnImopm8EGi/CdTcaWdscCdVuV082IxB4Nyiv
         m3O6Lc6Uvio+vM5V6nMQ/S/56eSWJNPET7L+72Agz3XHO8kyeIQT8z32of/5ctIS6DW5
         GPcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrU7phMlXEaIB5+QBCaw8rGmG8HP3rBzRJ11R5+9UWK4KTZYvAUBW8bAUYZwphJ++9NgD29q0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/KdjsMJUUAcfaBc/2tEaVwfxZuY/UdExoe9UlODMsGgVQXh3Y
	O5WunRk9P8lr50yvP44cnwL4bnC6br1r+CdEABt2BHbV4zp2FFZssNmzuD19b444THaapn4qdEe
	Gnd2AbRWRPElL0DLBwr2qkHzek44a8F/Dkdu/k6J3a1n/YLWwVRTdI94sxGZ/AWyi
X-Gm-Gg: ASbGncslh+nwSs5xwDOysovRHeRfAD8O+IGcVQhA7UM3Lr5FZlAJWuE6XAaxtKisZ/k
	hoP3yn3fs/nHgs6FbQnWooaoB2wJlNzyBEkFE7He+0SFHrRLBV6G0BaJFgCyaB5+C3AZ2TmrBUX
	9WxdymjO7ykZ0cHJ3K68HcFDr5SQhtRVI/UdgRIgkiTaoN8aiI29RS4F2WWSe4Okl/7DZTFbI26
	VqKrrZh8O09txcsU0hYpEW7zsdI1CHKEw+zlly48BIltLJPFxKPlckcyAZ0srS90asoF0Zd77TD
	ZIwouvjD1rvQQjKhXYJnYBK5tuZG2kZV+OCoPiN/Mda8C4KmqAawl9VfH3Nl9vZr9+/AguG3C8T
	bIlfVe4ej
X-Received: by 2002:a05:6a00:ad0:b0:778:97e1:f499 with SMTP id d2e1a72fcca58-77bf9c4b95bmr8516639b3a.21.1758211680071;
        Thu, 18 Sep 2025 09:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZc2KMQorqsMojd+psOzChVBBFfgXHMXPd0ZabNoIuhc/lj2qbM9Uj58M/Sr3DdXCoo4dh4A==
X-Received: by 2002:a05:6a00:ad0:b0:778:97e1:f499 with SMTP id d2e1a72fcca58-77bf9c4b95bmr8516591b3a.21.1758211679475;
        Thu, 18 Sep 2025 09:07:59 -0700 (PDT)
Received: from [192.168.11.100] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec403c1sm2705361b3a.83.2025.09.18.09.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 09:07:58 -0700 (PDT)
Message-ID: <d3f77052-bb4f-4ba4-b165-b672cc67147e@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 21:37:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] wifi: ath11k: fix group data packet drops during
 rekey
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <aLlaetkalDvWcB7b@stanley.mountain>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <aLlaetkalDvWcB7b@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0x2OhR4lZ7r6jTr1gZcVimI3gacdmkyo
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cc2e61 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=b9pLVJSGNDumshOBPLQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 0x2OhR4lZ7r6jTr1gZcVimI3gacdmkyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX3CK4AOeanWlq
 KdlnPI1ncXHu7k4ouCxLW3lcdqtM63AP7iw0xqyJ6VUd6aA7MkwDXxMkqTp3G8X4qEulm6sPqhA
 reEhbKINyv3IbuBD/e5I9rCnfT4471llxkx5jKvnTHTNQgo7HJeYabWc5YOszJXwwK3qt3Hvgnm
 Y8lCXxQeiI4A2RTUrOu+yHCvWlWfQMcbCz0Muwq2NisQ6acoiKiryXH1pKVL/IVuTqIyDr3DaB/
 ZB8x56v02DoAFmafEbmJtSAkONNK/XzhtLJn/oK4iGyZ8/4i1cXsC4yDKBUo+1JXEBpFY4Ofs71
 Nl1EQZLdlay4YXInIbyj/NVshvrX/PVjxoGESzO8t6+FmWKXticUO2vMHkV3gIb26B1a+6lzYbI
 HS+FWN+t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_090802_799406_11F2C68C 
X-CRM114-Status: GOOD (  21.71  )
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



On 9/4/2025 2:53 PM, Dan Carpenter wrote:
> Hello Rameshkumar Sundaram,
> 
> Commit 97acb0259cc9 ("wifi: ath11k: fix group data packet drops
> during rekey") from Aug 10, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/net/wireless/ath/ath11k/mac.c:4459 ath11k_mac_op_set_key()
> 	warn: bitwise AND condition is false here
> 
> drivers/net/wireless/ath/ath11k/mac.c
>      4428
>      4429         /* Allow group key clearing only in AP mode when no stations are
>      4430          * associated. There is a known race condition in firmware where
>      4431          * group addressed packets may be dropped if the key is cleared
>      4432          * and immediately set again during rekey.
>      4433          *
>      4434          * During GTK rekey, mac80211 issues a clear key (if the old key
>      4435          * exists) followed by an install key operation for same key
>      4436          * index. This causes ath11k to send two WMI commands in quick
>      4437          * succession: one to clear the old key and another to install the
>      4438          * new key in the same slot.
>      4439          *
>      4440          * Under certain conditions—especially under high load or time
>      4441          * sensitive scenarios, firmware may process these commands
>      4442          * asynchronously in a way that firmware assumes the key is
>      4443          * cleared whereas hardware has a valid key. This inconsistency
>      4444          * between hardware and firmware leads to group addressed packet
>      4445          * drops after rekey.
>      4446          * Only setting the same key again can restore a valid key in
>      4447          * firmware and allow packets to be transmitted.
>      4448          *
>      4449          * There is a use case where an AP can transition from Secure mode
>      4450          * to open mode without a vdev restart by just deleting all
>      4451          * associated peers and clearing key, Hence allow clear key for
>      4452          * that case alone. Mark arvif->reinstall_group_keys in such cases
>      4453          * and reinstall the same key when the first peer is added,
>      4454          * allowing firmware to recover from the race if it had occurred.
>      4455          */
>      4456
>      4457         is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
>      4458                              !arvif->num_stations);
> --> 4459         if ((flags & WMI_KEY_PAIRWISE) || cmd == SET_KEY || is_ap_with_no_sta) {
>                                ^^^^^^^^^^^^^^^^
> WMI_KEY_PAIRWISE is zero so this is false.
> 
> I should probably write a static checker warning for code that does:
> 
> 	flags |= WMI_KEY_PAIRWISE;
> 

Thanks for reporting this, will send a patch to fix the if() as well as 
remove the code that does |= WMI_KEY_PAIRWISE.


>      4460                 ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
>      4461                 if (ret) {
>      4462                         ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
> 
> regards,
> dan carpenter


--
Ramesh


