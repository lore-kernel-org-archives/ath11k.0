Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1E5C531D0
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 00:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7n+zUjOmQKkw0T5F9B1XnByOrjXiy3/lcQEMuS2a9U=; b=AOXbF+HrqNQ5oGoVY0/2TmO8o4
	KgDsf+tz8k88FBllPUdaB53CV8TR5og01sTEfH2JysER7bM8HP05zOVfvPl5aucS/Xg0jqQ4KwFiF
	0pviNWXb5ZmYXmUm4w7LNcrdFLUmN+8LfgcsgZgFMDPomx8Be/+fceZxOsRUKhmwuudZg80zg4mYV
	sET9vIXo2aFay9UfP0PwJXHGM7HMkfx3t9WRXUqRl1l8QnOObkLuCnHJty1O0X+MiyYhjpprua+qT
	dZmrJ6dvIDjuMWPmgeKGhURUlRbUZmku4PMd4IKQPJzksD05IPFpGyR4ywb51RJawVxreQ0tbqiZd
	wPUk/qNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3xP-0000000FIuP-2Bdz;
	Fri, 24 Jul 2026 00:40:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3xM-0000000FIu1-3DRK
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 00:40:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeRHS1202122
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 00:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7n+zUjOmQKkw0T5F9B1XnByOrjXiy3/lcQEMuS2a9U=; b=N456S+rczol82cMy
	5PBrcT8EnNPOBHGSuB6kZKPmhtb4Fl2J1YyjybtLl134MsWl7L8jb/tR6YV2RGAr
	ZRUs7SubKxUn++J+BW5DHC76uqFROwkQpNX+Irs8f5Wg9gBCDFUZOBDS46Os8TO6
	9C1aN1UepEADLiuf/iCLPYCBuOeO0PQWRNQHaW5FQdp9ikIF0ND74HYY3VqMLnbR
	3mnDPtoRQ0GmFUyYgH5l7eqCESUJqASol1xCJ1oS8BG5//IFtfQbi3uQtVIbTyaD
	5OHOUXM+dKxObduo87Ol8zXJIYpjLsthA1VOKizig35moraF+Mcre0JKzpZUBWen
	r4B1Mg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamscdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 00:40:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1025176a91.0
        for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 17:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784853602; x=1785458402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7n+zUjOmQKkw0T5F9B1XnByOrjXiy3/lcQEMuS2a9U=;
        b=NbAhdi1Tyd9sjoyeTCTYfi0lNG4Cod0BGPEdBgK9D7YFJHwKfT+iYYlY2C5ZdrJSDI
         V0E2ENgkZwSZ1aR/fPhCMO+lhGS4BDf1hZYKz11ZTzWFdQN0hpYoO4OnODnkM66Mzxpz
         o/25X8Sil7cJMWrCYHh59CNXaY5zDxOj6SQUFhDCxxOaa+IURjdi+XyDlv4z+LcJ5323
         ZnqzkgirY2EYyYxaPjhdYIs0W+NfHOep/3+HYzviN6BgnFeBfKNkHb+VktLzr5mQBVP1
         6ugQ1wHVhdO20ndmZGwlaOrcOVZ6qLqxn3mgwPHZdi8VoGoVhZ42j/dv+fu7TZkJ1q+p
         96sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784853602; x=1785458402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7n+zUjOmQKkw0T5F9B1XnByOrjXiy3/lcQEMuS2a9U=;
        b=hDxtbp5ecoAe30r612FZwTsJ3C0+wEYoBjWPbYWnG7pKiK4wS/LRUk+hJVnx+qBqq9
         yy/2KJQe1LZ4TyDE9e7EoRb5xJ3LdaZplIVg2LSJvmZdlFWbnymLspGmXKuMfdfdhtsf
         +XAMZqiRE8H4PxqtHY80wm7aJY5u62oivjm838ZFzQtLCpD55ajaJj9EDYprZY2BTUdH
         9rnJ5CTrpv0vMnciA0MFXdAajr6oL/UPTZ5x0eU4zYOOvNOavMLeyxUGUmGOJkvf0WLF
         2aYmBtqCyC0o1cSEEINymy9vLp0fbPMV+99tmsvBHzl6lG0Hz6+gCdFtUmf8CFi+1bL9
         JMAw==
X-Forwarded-Encrypted: i=1; AHgh+RpPQk2MfPtoa6D9I3jb2YY0zpwxOo7GQfYcCJB0M2lI+kIX7P5mi7dCh1pDiLrKbCwFhXkgMuU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJHIAK4ltO7bywIz72wQ/VskScd5iqbzZ0cLi36CrRvTlKd3sS
	kMYT9xlpIPH9KSBJYoJJWkECGBrO1/n00U08I3XcPvdGwrgUJ0dM2GV+FBJ4bkL3gBMljJpRr55
	eDMatOuNtEMvYxJeK7yLyFwuCo3HghsXIfn2eWc61RTbQ/Cu6Z1xeUcDyPn8JT7iI
X-Gm-Gg: AR+sD10A2lCLMAnh4Rk/c4UedDzGARKcgVHnaHLt/XJ3SgXdgxD4nZTn1tjfTm8gP03
	2PUrU+F1Fez+hWckYuJWqzq+Yq2MZKPVSG0s8+RN6QMw21CH7/EcwC7oIVljso9rEzzc7j4j9YA
	cTLu2zokQeXNINyi+ytuk6uK+BkjJxWr/E9Q++d1i2wpLJnzn6e808pZvTiHmxSp0Sp2D3hNiNl
	BnyMAa5+FsRgGwHPgSSB/Mh/vONYwq0v2ySscfnDgqJlz1GJdHRdVpSMk2y05l5Sv9mdMOQtx2k
	pdvYOufoOp/PdEOK+5bcTGfZ4mETAf4UVHZt35E+FuUQE6TFnlLFsznDoYaXBbmphxrGOMtjQpM
	9JvRnZQm4TQsvYAy2AecPrZOjx5xaAKDmfvix7weCzYM5Veqk2OlUVSTT7Q==
X-Received: by 2002:a17:90b:3911:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38ec8405233mr5035634a91.6.1784853601699;
        Thu, 23 Jul 2026 17:40:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3911:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38ec8405233mr5035605a91.6.1784853601220;
        Thu, 23 Jul 2026 17:40:01 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13002f39sm20365778c88.1.2026.07.23.17.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 17:40:00 -0700 (PDT)
Message-ID: <a01b1349-c144-49e3-b669-4461d3ef1485@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 17:39:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: fix txpower in ap mode for 6 Ghz
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260514202750.3040404-1-s.gottschall@dd-wrt.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260514202750.3040404-1-s.gottschall@dd-wrt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAwMyBTYWx0ZWRfX36lGbJC/5IDu
 QhSL5SzissVMqvJDY4FfeOPRiKc+SqYwB4CkgHiNL0dlR+9fs/rfcOu6qLueVdmE8Tr+IYMZaoV
 EHSjQDug+WtCZwtws1Hg787eZBmA21YvOuqybS557MINicG3Yarmjm7EES1Ou4/wdR6KI8GEApV
 PoYu2/MlgpDmneis3iArXoieVK+FtcdLZVCS5At1J7O2RHArMuDw/aJOaMMkCzbCEGCAi3JPtUM
 wcd7VvblNEJry+JLAs6ngSetZY9wxpoVt/jAJ/GfEb7FLJ+fYLnuGEjyu5WwnKc3DNRmSisd1zN
 dBck/B7rvn/T20QEwWjgTgDqMYZ7eJrA8P6UyKBjkFqSgRvbWICpQokUjjYWDY7hn9hRN7WJ8nh
 zgIdp3VFtSJZTKDN6iTgKRt/VnIeccMS+D9OlRwd3O1HqfrTD1N5pRJojh07+GSAthQAyNLdjLB
 vThoblkJHKTYu5aDtSQ==
X-Proofpoint-GUID: bkWfRuj-grnHK49yPpeASmeiUWTpsWxN
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a62b463 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=FdPzbulkkTFOobXHXXcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAwMyBTYWx0ZWRfXztOGDmFTbFch
 QLVmHS3duKLHH8oCEpRkoQmv93NkoMWwV2VYMwvYg4gjXnAkwGWuRMXyH2BaMFEQH/hSsW6EZNu
 d4z/g9tFiAzu7hH5urDbzBt2UTWSv8k=
X-Proofpoint-ORIG-GUID: bkWfRuj-grnHK49yPpeASmeiUWTpsWxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_174004_929046_21190B30 
X-CRM114-Status: GOOD (  10.91  )
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

On 5/14/2026 1:27 PM, Sebastian Gottschall wrote:
> there is an issue which has been discovered a while ago while testing
> which killed txpower to 0 dBm once scanning is triggered in AP mode
> on QCN9074 based chipsets if 6 GHz is in use.
> ath11k_wmi_send_vdev_set_tpc_power must be set in AP mode in the same
> way is it is for STA as it is implemented in ath12k and in the
> qsdk version for ath11k.
> this patch must be considered to be backported (i discovered that issue
> already 2 years ago)

In addition to Baochen's comments my comment is that this doesn't clearly
describe the problem and the solution.

The Submitting Patches document tells us to "Describe your changes [...] as if
you are giving orders to the codebase to change its behaviour."

Also a subject nit: s/Ghz/GHz/ for proper SI representation

/jeff

