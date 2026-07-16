Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58E3C44507
	for <ath11k@archiver.kernel.org>; Thu, 16 Jul 2026 00:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxSym0MG0DTsfrTZy5yY04eAKQV5OakSQtDa3iUK2PI=; b=CdQJje7CYvVd0+LJNWWcW04rNp
	lO4Ys5w4YfjYjpmIIIv6z7F1irNvXVygwnCnELWubcWocy3HrGzFy+kZzXlSGy4E1i9734AQCrHOm
	fFF56AoPJNgfcuNXQYQQkvG6J0ew1hfMfWrR//QccFlj5P1aoyJpswoB44ocZ9TFvwxQovLXv/j6x
	NX4qgvoqPCJoRCpluUpYRRMemA3QrktlNEbSkqTa4DYkLvi+lqHTmi5n8x6wTMPvlGOFYPhOqaedK
	6WIlNcJaY8YBnIlIO4G9PlSaNY+uI8CEUrQdeu5D+2pZDr16MjyfLLmrDQHUvPlM2VoEdUBSISFYv
	zrTI/22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkARV-0000000GA7l-0101;
	Thu, 16 Jul 2026 00:59:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkARS-0000000GA76-2rV2
	for ath11k@lists.infradead.org;
	Thu, 16 Jul 2026 00:59:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0Y8BH1006193
	for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 00:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxSym0MG0DTsfrTZy5yY04eAKQV5OakSQtDa3iUK2PI=; b=kCYoa4PF/NvUiTHG
	6+87jHuqfpW/wdcMJteLafDiQmob/cw49hw6YAq7hUvZOwCNFjhgsP8w1uRWviTI
	KnOpag0pnRAYExClazyWzGCoQNiPvBis0M+wrUlU6x1j76cm8ZoL3Nu9Q5KpUn5B
	scF0S2pR8yb4i65bbJmobSmccSNLnttQkvM9DFh4wVX6an6uPh0zPF9c42ZSjedC
	iStyp4B7J6g6P76jvuQhVEA20JkilZfCBgS9KvExMdTJ6hGMq2bMoiZukp8AWQG8
	bZT3rRBKrqoxQTk0EpjbkbA5i6wFt+wf/JQ4ZVYjq0zh/FDEdZrHE11YYr0nMm5x
	8EIMCw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fecny9yeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 00:59:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso3127553b3a.0
        for <ath11k@lists.infradead.org>; Wed, 15 Jul 2026 17:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784163548; x=1784768348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fxSym0MG0DTsfrTZy5yY04eAKQV5OakSQtDa3iUK2PI=;
        b=Rla4DTKuLJcJ/Rd1URnsImRkYJ5GgZI8JF0emfI1QaGGzDPS8UY3egrA/ojlK4hS4u
         Ykp6qvsdxVzqPLsQH2LDih9A8QyvKUM5Gwq7avp584QpdfMhwu3NARfNZuYUdqvHIzXw
         iTyzoZowYri6cEh2OwkK3xvb4vkMzSMtW7IKb8W/eW8d15nBFtApQ3etQ6itFX6brHgp
         xLtg0E70Zzs5GVhkbEsyJbvGDFXTvX5Tx/WcbumkfIhkRpAeJO/QWsnfQmQTeCZXEqQn
         b5N6dIbxTuMOLcYtKVzmaMeU5s+TQ/YDwj1eyBKCGlvU8e2hVgxYDFwTTis9uwxF/xbA
         o2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784163548; x=1784768348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxSym0MG0DTsfrTZy5yY04eAKQV5OakSQtDa3iUK2PI=;
        b=TkWnIgylq/bmlxBxpl1Kxl8rQ27T9Oo4qvPVyxPrPU4koyzh1aPPMLyNCIVJS5T6xD
         7+lXe94D1KWnRdNx+2lEk3toLL9XX6ChPsewSkifrTql5cNZzmDOml/V7PBOCqdGelQy
         F5Dhidw6jR2UuSv+ITqFjJD//ySHZijqH1KN0vvNhdKRgEiUWcehi3hg/twkpcmCLU3e
         YViqV+dPEUWJsdk2Qe4Dx7EzNV2Zsget2N0b3brJlgcx8QQSKRUtonr0DrXo2iWSFa5Z
         uV4z3eMvPasZNDOyTq5akdMIuIOVaKVJ9Z2Xhwv3N4azYjhiWXamnpkJGHn9tXXgGokV
         m8jA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/zPwwi5siPAfGROIfADShg8Bp7Wg8ozWh/DSaQov0HKO0ECykWNnW8YagpQW+0CAKq0YjDcI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsbZV2LpZwBScfLX/XObEv7sJpE5AnOVFu7QZWVcTsUn/wLbV2
	ZpQUBpYoyHiu8WB/1EC3yVIVPrRy0gtSAmdPIhJZYXgTtea7hw8VSJKMFEF6hno+XyuT1uLTbkV
	ghrO4IeMM1YnbNuduE/Pu97lOH2FGW+JtsW9rJx5LuzKnouvMaAvMViXNZwqvcvMS
X-Gm-Gg: AfdE7ck2a9bMNVrtSq6aLSh9QNEM0yafu/0kKB0myvLWjtFsaOx37nD89f6TG/wsJBx
	zgpRpeMnuxNiYkU0XJXxV+hu8pAHVyRj4KPhbgJi2Nte/aMdQkHxPol8wlMHqPXnobS9jKKBiAF
	sssXVt9Y2H2YT+Wf08l3l3nV7c4SBq4NCTy+SxEdjRLJv1Qw0jEFyRjCDy8q8wSmBwATfPLiSXB
	Gpzsbqr0od3gq9pVXFZ3KSXdb7UlLBVIeWucoiwlRznodbhNC0kCqTBLI0IBS1Ki+EEA/eRqOGJ
	PLaI2ClBVTnNaFfe0a03Xhm5+WDCTtXKrHoA3h7JI6jkcNbuu6qSVXDB/izweQOskb41corXzFj
	G5yGwMKuAVgfEa7j2LaQ5Wb22DjRY7Oix7iPdHNBoECLVz9H9R6l2GB2dDw==
X-Received: by 2002:a05:6a20:4307:b0:3c3:7dfd:22c6 with SMTP id adf61e73a8af0-3c37dfd2500mr2681274637.73.1784163548110;
        Wed, 15 Jul 2026 17:59:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:4307:b0:3c3:7dfd:22c6 with SMTP id adf61e73a8af0-3c37dfd2500mr2681244637.73.1784163547629;
        Wed, 15 Jul 2026 17:59:07 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5306afsm5588023eec.9.2026.07.15.17.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 17:59:07 -0700 (PDT)
Message-ID: <faf48c76-373a-42c1-9c69-cfbc5178640a@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:59:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k/ath12k: release QMI handles on late init
 failures
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Anilkumar Kolli
 <quic_akolli@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Kalle Valo
 <kvalo@kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
References: <20260715064042.1988288-1-lgs201920130244@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260715064042.1988288-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAwNiBTYWx0ZWRfXxImLxFdFcKae
 7QU5xWdKrAkrPsULniSWy22VZ33bbZEWA1zhCEJtMgiiIXi9rUKrNdnqWQYNgb2RSdotEWrf0k7
 9OMzhicsCfyOOV5QC8xLKtj5jOtCso8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAwNiBTYWx0ZWRfX5kVTJtU6pH8u
 7OI2HGXuPVWfNT4droX7DNriPUmNbrIi7/0CXzNPONg/568cRbWLIIwWAw1B6ILnu+igLVCItyL
 vsSKSWch6DSXM3FvuFJBSGCWN39J2odV53CI3Nz7FXQRLsr8kN7b0Rc9Qf1wMBY/27Io4Trvpb3
 pVQLyRh7OL+0/Hcm+gBTohb9iKBGutJDyXvjQlRSCz/4FKfCTJEDj5o7EJL8/iOX6a93IZCjDdo
 5mbMDkClC99DShKe2+fge5XCknAtqzuLF+v//FpIiFDWK4mjHH40kp+0KglOO/HWGsDmldhPc4s
 5O7E2QsQclPm/dKcYiWO5Zu75dtOdkzY0CjpHhTe8XlQYFQZzt8KYOCgAolrCRFqRw5RYXLfx9W
 pLWlA947B6DTzEFuTHhcMmQ0g96M0+xOiPrNnVZ5bUH/+xsbHZGO1zymvvc3lROtf+KdlGYU6vB
 U4GNHw1x1z6pUXEOxyw==
X-Proofpoint-ORIG-GUID: LXU8mipJRldu7npSPobz7PSTUfKJpAPx
X-Authority-Analysis: v=2.4 cv=Lt2iDHdc c=1 sm=1 tr=0 ts=6a582cdd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=jDosp7zG289F-1VKxZYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: LXU8mipJRldu7npSPobz7PSTUfKJpAPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_175910_834651_3E096A2D 
X-CRM114-Status: GOOD (  13.69  )
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

On 7/14/2026 11:40 PM, Guangshuo Li wrote:
> ath11k and ath12k initialize their QMI handles before allocating the QMI
> event workqueues and registering the service lookups.
> 
> If either of these later initialization steps fails, the functions
> return without releasing the initialized QMI handles, leaking their
> resources.
> 
> Release the QMI handles on the late failure paths in both drivers.
> 
> ath12k_qmi_deinit_service() uses ab->qmi.ab to determine whether QMI
> service initialization completed successfully. Set it only after all
> initialization steps succeed. Keep the ath11k assignment unchanged
> because ath11k does not use it as an initialization-success guard.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v2:
>   - Set ath12k ab->qmi.ab only after QMI service initialization succeeds,
>     as suggested by Baochen Qiang.
>   - Fix the same late initialization QMI handle leak in ath11k, as
>     suggested by Vasanthakumar Thiagarajan.
>   - Drop the Reviewed-by tag due to the code changes.
> 
>  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
>  drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
>  2 files changed, 18 insertions(+), 5 deletions(-)

Please split into two patches, one for ath11k and one for ath12k


