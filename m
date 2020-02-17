Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3hJ2-0006lM-Fs
 for ath11k@lists.infradead.org; Mon, 17 Feb 2020 14:23:29 +0000
Message-ID: <06100182506e35438e31990a56a2668a6de31735.camel@sipsolutions.net>
Subject: Re: [RFC 0/2] add 802.11 decapsulation offload support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 17 Feb 2020 15:23:22 +0100
In-Reply-To: <1581942277-585-1-git-send-email-mpubbise@codeaurora.org>
 (sfid-20200217_132517_718887_22B874B1)
References: <1581942277-585-1-git-send-email-mpubbise@codeaurora.org>
 (sfid-20200217_132517_718887_22B874B1)
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Mon, 2020-02-17 at 17:54 +0530, Manikanta Pubbisetty wrote:
> Adding support for offloading 802.11 decapsulation to the HW.
> This reduces the CPU cycles spent on host CPU for doing the 
> conversion from 802.11 format to ethernet format and thereby
> improving the performance of the device.

Would be nice to quantify that :)

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
