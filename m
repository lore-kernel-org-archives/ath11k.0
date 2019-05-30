Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWFuv-0008P1-A5
 for ath11k@lists.infradead.org; Thu, 30 May 2019 07:56:11 +0000
MIME-Version: 1.0
Date: Thu, 30 May 2019 00:56:01 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [RFC] ath11k: add HE rate reporting
In-Reply-To: <db697dab-7011-f550-d995-89cefd346369@phrozen.org>
References: <20190523104730.15256-1-john@phrozen.org>
 <db697dab-7011-f550-d995-89cefd346369@phrozen.org>
Message-ID: <96d5a27d4ec109ef51301f280a0d227f@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath11k@lists.infradead.org

On 2019-05-23 03:49, John Crispin wrote:
> On 23/05/2019 12:47, John Crispin wrote:
>> We need to figure out how to read the ru_alloc and DCM values from FW.
> 
> Hi Rajkumar,
> 
> could you help me figure out how to get the DCM/RU values in the FW
> reporting ? I have marked places them with TODO tags in the code
> 
John,

Thanks for the patch. I dig further for DCM/RU. The HE information
can be retrieved only through PPDU stats.

Tx PPDU stats are processed through HTT event 
(HTT_PPDU_STATS_USR_RATE_TLV).
Rx PPDU stats through monitor status ring 
(ath11k_hal_rx_parse_mon_status_tlv).
Need to handle HAL_PHYRX_HE_SIG_A_SU, HAL_PHYRX_HE_SIG_B1_MU cases.

he info will be reported out of bound data path. Hope sta_statistics 
will be
enough to populate to user application.

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
